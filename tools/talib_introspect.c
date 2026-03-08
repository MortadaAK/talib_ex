/*
 * Standalone tool that uses TA-Lib's abstract API to introspect all available
 * functions and output their metadata as JSON. This JSON is then consumed by
 * a generator script to produce FunctionDef.ex.
 *
 * Build:
 *   cc -o tools/talib_introspect tools/talib_introspect.c \
 *      $(pkg-config --cflags --libs ta_lib 2>/dev/null || echo "-I$(brew --prefix ta-lib)/include/ta-lib -L$(brew --prefix ta-lib)/lib -lta-lib") -lm
 *
 * Run:
 *   ./tools/talib_introspect > tools/talib_functions.json
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include "ta_libc.h"
#include "ta_abstract.h"

static void print_escaped(const char *s) {
    if (!s) { printf("null"); return; }
    printf("\"");
    while (*s) {
        if (*s == '"') printf("\\\"");
        else if (*s == '\\') printf("\\\\");
        else if (*s == '\n') printf("\\n");
        else putchar(*s);
        s++;
    }
    printf("\"");
}

static void print_snake_case(const char *name) {
    /* Convert TA-Lib names like "CDLABANDONEDBABY" to "cdl_abandoned_baby" style.
     * We handle this by looking up the camelCase name which has proper word boundaries. */
    printf("\"");
    for (const char *p = name; *p; p++) {
        putchar(tolower(*p));
    }
    printf("\"");
}

static const char* input_type_str(TA_InputParameterType t) {
    switch(t) {
        case TA_Input_Price:   return "price";
        case TA_Input_Real:    return "real";
        case TA_Input_Integer: return "integer";
        default:               return "unknown";
    }
}

static const char* opt_input_type_str(TA_OptInputParameterType t) {
    switch(t) {
        case TA_OptInput_RealRange:    return "real_range";
        case TA_OptInput_RealList:     return "real_list";
        case TA_OptInput_IntegerRange: return "integer_range";
        case TA_OptInput_IntegerList:  return "integer_list";
        default:                       return "unknown";
    }
}

static const char* output_type_str(TA_OutputParameterType t) {
    switch(t) {
        case TA_Output_Real:    return "real";
        case TA_Output_Integer: return "integer";
        default:                return "unknown";
    }
}

static int first_func = 1;

static void print_func(const TA_FuncInfo *funcInfo, void *opaqueData) {
    (void)opaqueData;
    unsigned int i;

    if (!first_func) printf(",\n");
    first_func = 0;

    printf("  {\n");
    printf("    \"name\": "); print_escaped(funcInfo->name); printf(",\n");
    printf("    \"camel_case_name\": "); print_escaped(funcInfo->camelCaseName); printf(",\n");
    printf("    \"group\": "); print_escaped(funcInfo->group); printf(",\n");
    printf("    \"hint\": "); print_escaped(funcInfo->hint); printf(",\n");
    printf("    \"flags\": %d,\n", funcInfo->flags);
    printf("    \"is_candlestick\": %s,\n", (funcInfo->flags & TA_FUNC_FLG_CANDLESTICK) ? "true" : "false");
    printf("    \"is_overlap\": %s,\n", (funcInfo->flags & TA_FUNC_FLG_OVERLAP) ? "true" : "false");
    printf("    \"is_volume\": %s,\n", (funcInfo->flags & TA_FUNC_FLG_VOLUME) ? "true" : "false");
    printf("    \"has_unstable_period\": %s,\n", (funcInfo->flags & TA_FUNC_FLG_UNST_PER) ? "true" : "false");

    /* Inputs */
    printf("    \"inputs\": [\n");
    for (i = 0; i < funcInfo->nbInput; i++) {
        const TA_InputParameterInfo *paramInfo;
        TA_GetInputParameterInfo(funcInfo->handle, i, &paramInfo);

        if (i > 0) printf(",\n");
        printf("      {\n");
        printf("        \"param_name\": "); print_escaped(paramInfo->paramName); printf(",\n");
        printf("        \"type\": \"%s\",\n", input_type_str(paramInfo->type));
        printf("        \"flags\": %d", paramInfo->flags);

        if (paramInfo->type == TA_Input_Price) {
            printf(",\n        \"price_components\": {\n");
            printf("          \"open\": %s,\n",          (paramInfo->flags & TA_IN_PRICE_OPEN) ? "true" : "false");
            printf("          \"high\": %s,\n",          (paramInfo->flags & TA_IN_PRICE_HIGH) ? "true" : "false");
            printf("          \"low\": %s,\n",           (paramInfo->flags & TA_IN_PRICE_LOW) ? "true" : "false");
            printf("          \"close\": %s,\n",         (paramInfo->flags & TA_IN_PRICE_CLOSE) ? "true" : "false");
            printf("          \"volume\": %s,\n",        (paramInfo->flags & TA_IN_PRICE_VOLUME) ? "true" : "false");
            printf("          \"open_interest\": %s\n",  (paramInfo->flags & TA_IN_PRICE_OPENINTEREST) ? "true" : "false");
            printf("        }");
        }
        printf("\n      }");
    }
    printf("\n    ],\n");

    /* Optional inputs */
    printf("    \"opt_inputs\": [\n");
    for (i = 0; i < funcInfo->nbOptInput; i++) {
        const TA_OptInputParameterInfo *paramInfo;
        TA_GetOptInputParameterInfo(funcInfo->handle, i, &paramInfo);

        if (i > 0) printf(",\n");
        printf("      {\n");
        printf("        \"param_name\": "); print_escaped(paramInfo->paramName); printf(",\n");
        printf("        \"display_name\": "); print_escaped(paramInfo->displayName); printf(",\n");
        printf("        \"type\": \"%s\",\n", opt_input_type_str(paramInfo->type));
        printf("        \"default_value\": %g,\n", paramInfo->defaultValue);
        printf("        \"hint\": "); print_escaped(paramInfo->hint); printf(",\n");
        printf("        \"flags\": %d", paramInfo->flags);

        if (paramInfo->type == TA_OptInput_RealRange && paramInfo->dataSet) {
            const TA_RealRange *range = (const TA_RealRange *)paramInfo->dataSet;
            printf(",\n        \"range\": {\n");
            printf("          \"min\": %g,\n", range->min);
            printf("          \"max\": %g,\n", range->max);
            printf("          \"precision\": %d\n", range->precision);
            printf("        }");
        }
        else if (paramInfo->type == TA_OptInput_IntegerRange && paramInfo->dataSet) {
            const TA_IntegerRange *range = (const TA_IntegerRange *)paramInfo->dataSet;
            printf(",\n        \"range\": {\n");
            printf("          \"min\": %d,\n", range->min);
            printf("          \"max\": %d\n", range->max);
            printf("        }");
        }
        else if (paramInfo->type == TA_OptInput_IntegerList && paramInfo->dataSet) {
            const TA_IntegerList *list = (const TA_IntegerList *)paramInfo->dataSet;
            printf(",\n        \"values\": [\n");
            for (unsigned int j = 0; j < list->nbElement; j++) {
                if (j > 0) printf(",\n");
                printf("          {\"value\": %d, \"string\": ", list->data[j].value);
                print_escaped(list->data[j].string);
                printf("}");
            }
            printf("\n        ]");
        }
        else if (paramInfo->type == TA_OptInput_RealList && paramInfo->dataSet) {
            const TA_RealList *list = (const TA_RealList *)paramInfo->dataSet;
            printf(",\n        \"values\": [\n");
            for (unsigned int j = 0; j < list->nbElement; j++) {
                if (j > 0) printf(",\n");
                printf("          {\"value\": %g, \"string\": ", list->data[j].value);
                print_escaped(list->data[j].string);
                printf("}");
            }
            printf("\n        ]");
        }

        printf("\n      }");
    }
    printf("\n    ],\n");

    /* Outputs */
    printf("    \"outputs\": [\n");
    for (i = 0; i < funcInfo->nbOutput; i++) {
        const TA_OutputParameterInfo *paramInfo;
        TA_GetOutputParameterInfo(funcInfo->handle, i, &paramInfo);

        if (i > 0) printf(",\n");
        printf("      {\n");
        printf("        \"param_name\": "); print_escaped(paramInfo->paramName); printf(",\n");
        printf("        \"type\": \"%s\",\n", output_type_str(paramInfo->type));
        printf("        \"flags\": %d\n", paramInfo->flags);
        printf("      }");
    }
    printf("\n    ]\n");

    printf("  }");
}

int main(void) {
    TA_RetCode retCode;

    retCode = TA_Initialize();
    if (retCode != TA_SUCCESS) {
        fprintf(stderr, "TA_Initialize failed: %d\n", retCode);
        return 1;
    }

    printf("[\n");
    TA_ForEachFunc(print_func, NULL);
    printf("\n]\n");

    TA_Shutdown();
    return 0;
}

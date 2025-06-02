defmodule TalibEx.FunctionDef do
  @moduledoc false
  @generic_output %{name: :result, type: :double_array}
  @time_period1 %{
    name: :time_period,
    type: :integer,
    min: 1,
    max: 100_000,
    default: 5,
    doc: "Number of period"
  }
  @time_period2 %{
    name: :time_period,
    type: :integer,
    min: 1,
    max: 100_000,
    default: 5,
    doc: "Number of period"
  }
  @generic %{name: :values, type: :double_array}
  @generic0 %{name: :values0, type: :double_array}
  @generic1 %{name: :values1, type: :double_array}
  @open %{name: :open, type: :double_array, doc: "Open Price List"}
  @high %{name: :high, type: :double_array, doc: "High Price List"}
  @low %{name: :low, type: :double_array, doc: "Low Price List"}
  @close %{name: :close, type: :double_array, doc: "Close Price List"}
  @volume %{name: :volume, type: :double_array, doc: "Volume List"}
  @fast_limit %{
    name: :fast_limit,
    type: :double,
    min: 0.01,
    max: 0.99,
    default: 0.75,
    doc: "Upper limit use in the adaptive algorithm"
  }
  @slow_limit %{
    name: :slow_limit,
    type: :double,
    min: 0.01,
    max: 0.99,
    default: 0.25,
    doc: "Lower limit use in the adaptive algorithm"
  }
  @min_period %{
    name: :min_period,
    type: :integer,
    min: 2,
    max: 100_000,
    default: 5,
    doc: "Value less than minimum will be changed to Minimum period"
  }
  @max_period %{
    name: :max_period,
    type: :integer,
    min: 2,
    max: 100_000,
    default: 15,
    doc: "Value higher than maximum will be changed to Maximum period"
  }
  @fast_period %{
    name: :fast_period,
    type: :integer,
    min: 2,
    max: 100_000,
    default: 5,
    doc: "Number of period for the fast MA"
  }
  @slow_period %{
    name: :slow_period,
    type: :integer,
    min: 2,
    max: 100_000,
    default: 15,
    doc: "Number of period for the slow MA"
  }
  @signal_period %{
    name: :signal_period,
    type: :integer,
    min: 1,
    max: 100_000,
    default: 1,
    doc: "Smoothing for the signal line"
  }
  @moving_average_type %{
    name: :moving_average_type,
    type: :ma_type,
    default: :sma,
    doc:
      "Type of moving average. `sma` | `ema` | `wma` | `dema` | `tema` | `trima` | `kama` | `mama` | `t3`"
  }
  @cdl_penetration %{
    name: :penetration,
    type: :double,
    min: 0,
    doc: "Percentage of penetration of a candle within another candle"
  }
  @mapping [
    %{
      name: "acos",
      doc: "Vector Trigonometric ACos",
      target: "TA_ACOS",
      inputs: [@generic],
      outputs: [@generic_output]
    },
    %{
      name: "ad",
      doc: "Chaikin A/D Line",
      target: "TA_AD",
      inputs: [@high, @low, @close, @volume],
      outputs: [@generic_output]
    },
    %{
      name: "add",
      doc: "Vector Arithmetic Add",
      target: "TA_ADD",
      inputs: [@generic0, @generic1],
      outputs: [@generic_output]
    },
    %{
      name: "adosc",
      doc: "Chaikin A/D Oscillator",
      target: "TA_ADOSC",
      inputs: [@high, @low, @close, @volume, @fast_period, @slow_period],
      outputs: [@generic_output]
    },
    %{
      name: "adx",
      doc: "Average Directional Movement Index",
      target: "TA_ADX",
      inputs: [@high, @low, @close, @time_period2],
      outputs: [@generic_output]
    },
    %{
      name: "adxr",
      doc: "Average Directional Movement Index Rating",
      target: "TA_ADXR",
      inputs: [@high, @low, @close, @time_period2],
      outputs: [@generic_output]
    },
    %{
      name: "apo",
      doc: "Absolute Price Oscillator",
      target: "TA_APO",
      inputs: [@generic, @fast_period, @slow_period, @moving_average_type],
      outputs: [@generic_output]
    },
    %{
      name: "aroon",
      doc: "Aroon",
      target: "TA_AROON",
      inputs: [@high, @low, @time_period2],
      outputs: [
        %{name: :down, type: :double_array, doc: "Arron Down"},
        %{name: :up, type: :double_array, doc: "Arron Up"}
      ]
    },
    %{
      name: "aroonosc",
      doc: "Aroon Oscillator",
      target: "TA_AROONOSC",
      inputs: [@high, @low, @time_period2],
      outputs: [@generic_output]
    },
    %{
      name: "asin",
      doc: "Vector Trigonometric ASin",
      target: "TA_ASIN",
      inputs: [@generic],
      outputs: [@generic_output]
    },
    %{
      name: "atan",
      doc: "Vector Trigonometric ATan",
      target: "TA_ATAN",
      inputs: [@generic],
      outputs: [@generic_output]
    },
    %{
      name: "atr",
      doc: "Average True Range",
      target: "TA_ATR",
      inputs: [@high, @low, @close, @time_period1],
      outputs: [@generic_output]
    },
    %{
      name: "avgprice",
      doc: "Average Price",
      target: "TA_AVGPRICE",
      inputs: [@open, @high, @low, @close],
      outputs: [@generic_output]
    },
    %{
      name: "bbands",
      doc: "Bollinger Bands",
      target: "TA_BBANDS",
      inputs: [
        @generic,
        @time_period2,
        %{name: :np_dev_up, type: :double, doc: "Deviation multiplier for upper band"},
        %{name: :np_dev_down, type: :double, doc: "Deviation multiplier for lower band"},
        @moving_average_type
      ],
      outputs: [
        %{name: :upper, type: :double_array, doc: "Upper Band"},
        %{name: :middle, type: :double_array, doc: "Middle Band"},
        %{name: :lower, type: :double_array, doc: "Lower Band"}
      ]
    },
    %{
      name: "beta",
      doc: "Beta",
      target: "TA_BETA",
      inputs: [@generic0, @generic1, @time_period1],
      outputs: [@generic_output]
    },
    %{
      name: "bop",
      doc: "Balance Of Power",
      target: "TA_BOP",
      inputs: [@open, @high, @low, @close],
      outputs: [@generic_output]
    },
    %{
      name: "cci",
      doc: "Commodity Channel Index",
      target: "TA_CCI",
      inputs: [@high, @low, @close, @time_period2],
      outputs: [@generic_output]
    },
    %{
      name: "cdl2_crows",
      doc: "Two Crows",
      target: "TA_CDL2CROWS",
      inputs: [@open, @high, @low, @close],
      outputs: [
        %{name: :list, type: :integer_array}
      ]
    },
    %{
      name: "cdl3_black_crows",
      doc: "Three Black Crows",
      target: "TA_CDL3BLACKCROWS",
      inputs: [@open, @high, @low, @close],
      outputs: [
        %{name: :list, type: :integer_array}
      ]
    },
    %{
      name: "cdl3_inside",
      doc: "Three Inside Up/Down",
      target: "TA_CDL3INSIDE",
      inputs: [@open, @high, @low, @close],
      outputs: [
        %{name: :list, type: :integer_array}
      ]
    },
    %{
      name: "cdl3_line_strike",
      doc: "Three-Line Strike",
      target: "TA_CDL3LINESTRIKE",
      inputs: [@open, @high, @low, @close],
      outputs: [
        %{name: :list, type: :integer_array}
      ]
    },
    %{
      name: "cdl3_outside",
      doc: "Three Outside Up/Down",
      target: "TA_CDL3OUTSIDE",
      inputs: [@open, @high, @low, @close],
      outputs: [
        %{name: :list, type: :integer_array}
      ]
    },
    %{
      name: "cdl3_stars_in_south",
      doc: "Three Stars In The South",
      target: "TA_CDL3STARSINSOUTH",
      inputs: [@open, @high, @low, @close],
      outputs: [
        %{name: :list, type: :integer_array}
      ]
    },
    %{
      name: "cdl3_white_soldiers",
      doc: "Three Advancing White Soldiers",
      target: "TA_CDL3WHITESOLDIERS",
      inputs: [@open, @high, @low, @close],
      outputs: [
        %{name: :list, type: :integer_array}
      ]
    },
    %{
      name: "cdl_abandoned_baby",
      doc: "Abandoned Baby",
      target: "TA_CDLABANDONEDBABY",
      inputs: [
        @open,
        @high,
        @low,
        @close,
        @cdl_penetration
      ],
      outputs: [
        %{name: :list, type: :integer_array}
      ]
    },
    %{
      name: "cdl_advance_block",
      doc: "Advance Block",
      target: "TA_CDLADVANCEBLOCK",
      inputs: [@open, @high, @low, @close],
      outputs: [
        %{name: :list, type: :integer_array}
      ]
    },
    %{
      name: "cdl_belt_hold",
      doc: "Belt-hold",
      target: "TA_CDLBELTHOLD",
      inputs: [@open, @high, @low, @close],
      outputs: [
        %{name: :list, type: :integer_array}
      ]
    },
    %{
      name: "cdl_breakaway",
      doc: "Breakaway",
      target: "TA_CDLBREAKAWAY",
      inputs: [@open, @high, @low, @close],
      outputs: [
        %{name: :list, type: :integer_array}
      ]
    },
    %{
      name: "cdl_closing_marubozu",
      doc: "Closing Marubozu",
      target: "TA_CDLCLOSINGMARUBOZU",
      inputs: [@open, @high, @low, @close],
      outputs: [
        %{name: :list, type: :integer_array}
      ]
    },
    %{
      name: "cdl_conceal_baby_swallow",
      doc: "Concealing Baby Swallow",
      target: "TA_CDLCONCEALBABYSWALL",
      inputs: [@open, @high, @low, @close],
      outputs: [
        %{name: :list, type: :integer_array}
      ]
    },
    %{
      name: "cdl_counterattack",
      doc: "Counterattack",
      target: "TA_CDLCOUNTERATTACK",
      inputs: [@open, @high, @low, @close],
      outputs: [
        %{name: :list, type: :integer_array}
      ]
    },
    %{
      name: "cdl_dark_cloud_cover",
      doc: "Dark Cloud Cover",
      target: "TA_CDLDARKCLOUDCOVER",
      inputs: [
        @open,
        @high,
        @low,
        @close,
        %{name: :penetration, type: :double}
      ],
      outputs: [
        %{name: :list, type: :integer_array}
      ]
    },
    %{
      name: "cdl_doji",
      doc: "Doji",
      target: "TA_CDLDOJI",
      inputs: [@open, @high, @low, @close],
      outputs: [
        %{name: :list, type: :integer_array}
      ]
    },
    %{
      name: "cdl_doji_star",
      doc: "Doji Star",
      target: "TA_CDLDOJISTAR",
      inputs: [@open, @high, @low, @close],
      outputs: [
        %{name: :list, type: :integer_array}
      ]
    },
    %{
      name: "cdl_dragonfly_doji",
      doc: "Dragonfly Doji",
      target: "TA_CDLDRAGONFLYDOJI",
      inputs: [@open, @high, @low, @close],
      outputs: [
        %{name: :list, type: :integer_array}
      ]
    },
    %{
      name: "cdl_engulfing",
      doc: "Engulfing Pattern",
      target: "TA_CDLENGULFING",
      inputs: [@open, @high, @low, @close],
      outputs: [
        %{name: :list, type: :integer_array}
      ]
    },
    %{
      name: "cdl_evening_doji_star",
      doc: "Evening Doji Star",
      target: "TA_CDLEVENINGDOJISTAR",
      inputs: [
        @open,
        @high,
        @low,
        @close,
        %{name: :penetration, type: :double}
      ],
      outputs: [
        %{name: :list, type: :integer_array}
      ]
    },
    %{
      name: "cdl_evening_star",
      doc: "Evening Star",
      target: "TA_CDLEVENINGSTAR",
      inputs: [
        @open,
        @high,
        @low,
        @close,
        %{name: :penetration, type: :double}
      ],
      outputs: [
        %{name: :list, type: :integer_array}
      ]
    },
    %{
      name: "cdl_gap_side_side_white",
      doc: "Up/Down-gap side-by-side white lines",
      target: "TA_CDLGAPSIDESIDEWHITE",
      inputs: [@open, @high, @low, @close],
      outputs: [
        %{name: :list, type: :integer_array}
      ]
    },
    %{
      name: "cdl_gravestone_doji",
      doc: "Gravestone Doji",
      target: "TA_CDLGRAVESTONEDOJI",
      inputs: [@open, @high, @low, @close],
      outputs: [
        %{name: :list, type: :integer_array}
      ]
    },
    %{
      name: "cdl_hammer",
      doc: "Hammer",
      target: "TA_CDLHAMMER",
      inputs: [@open, @high, @low, @close],
      outputs: [
        %{name: :list, type: :integer_array}
      ]
    },
    %{
      name: "cdl_hanging_man",
      doc: "Hanging Man",
      target: "TA_CDLHANGINGMAN",
      inputs: [@open, @high, @low, @close],
      outputs: [
        %{name: :list, type: :integer_array}
      ]
    },
    %{
      name: "cdl_harami",
      doc: "Harami Pattern",
      target: "TA_CDLHARAMI",
      inputs: [@open, @high, @low, @close],
      outputs: [
        %{name: :list, type: :integer_array}
      ]
    },
    %{
      name: "cdl_harami_cross",
      doc: "Harami Cross Pattern",
      target: "TA_CDLHARAMICROSS",
      inputs: [@open, @high, @low, @close],
      outputs: [
        %{name: :list, type: :integer_array}
      ]
    },
    %{
      name: "cdl_highwave",
      doc: "High-Wave Candle",
      target: "TA_CDLHIGHWAVE",
      inputs: [@open, @high, @low, @close],
      outputs: [
        %{name: :list, type: :integer_array}
      ]
    },
    %{
      name: "cdl_hikkake",
      doc: "Hikkake Pattern",
      target: "TA_CDLHIKKAKE",
      inputs: [@open, @high, @low, @close],
      outputs: [
        %{name: :list, type: :integer_array}
      ]
    },
    %{
      name: "cdl_hikkake_mod",
      doc: "Modified Hikkake Pattern",
      target: "TA_CDLHIKKAKEMOD",
      inputs: [@open, @high, @low, @close],
      outputs: [
        %{name: :list, type: :integer_array}
      ]
    },
    %{
      name: "cdl_homing_pigeon",
      doc: "Homing Pigeon",
      target: "TA_CDLHOMINGPIGEON",
      inputs: [@open, @high, @low, @close],
      outputs: [
        %{name: :list, type: :integer_array}
      ]
    },
    %{
      name: "cdl_identical_3_crows",
      doc: "Identical Three Crows",
      target: "TA_CDLIDENTICAL3CROWS",
      inputs: [@open, @high, @low, @close],
      outputs: [
        %{name: :list, type: :integer_array}
      ]
    },
    %{
      name: "cdl_inneck",
      doc: "In-Neck Pattern",
      target: "TA_CDLINNECK",
      inputs: [@open, @high, @low, @close],
      outputs: [
        %{name: :list, type: :integer_array}
      ]
    },
    %{
      name: "cdl_inverted_hammer",
      doc: "Inverted Hammer",
      target: "TA_CDLINVERTEDHAMMER",
      inputs: [@open, @high, @low, @close],
      outputs: [
        %{name: :list, type: :integer_array}
      ]
    },
    %{
      name: "cdl_kicking",
      doc: "Kicking",
      target: "TA_CDLKICKING",
      inputs: [@open, @high, @low, @close],
      outputs: [
        %{name: :list, type: :integer_array}
      ]
    },
    %{
      name: "cdl_kicking_by_length",
      doc: "Kicking - bull/bear determined by the longer marubozu",
      target: "TA_CDLKICKINGBYLENGTH",
      inputs: [@open, @high, @low, @close],
      outputs: [
        %{name: :list, type: :integer_array}
      ]
    },
    %{
      name: "cdl_ladder_bottom",
      doc: "Ladder Bottom",
      target: "TA_CDLLADDERBOTTOM",
      inputs: [@open, @high, @low, @close],
      outputs: [
        %{name: :list, type: :integer_array}
      ]
    },
    %{
      name: "cdl_long_legged_doji",
      doc: "Long Legged Doji",
      target: "TA_CDLLONGLEGGEDDOJI",
      inputs: [@open, @high, @low, @close],
      outputs: [
        %{name: :list, type: :integer_array}
      ]
    },
    %{
      name: "cdl_long_line",
      doc: "Long Line Candle",
      target: "TA_CDLLONGLINE",
      inputs: [@open, @high, @low, @close],
      outputs: [
        %{name: :list, type: :integer_array}
      ]
    },
    %{
      name: "cdl_marubozu",
      doc: "Marubozu",
      target: "TA_CDLMARUBOZU",
      inputs: [@open, @high, @low, @close],
      outputs: [
        %{name: :list, type: :integer_array}
      ]
    },
    %{
      name: "cdl_matching_low",
      doc: "Matching Low",
      target: "TA_CDLMATCHINGLOW",
      inputs: [@open, @high, @low, @close],
      outputs: [
        %{name: :list, type: :integer_array}
      ]
    },
    %{
      name: "cdl_mat_hold",
      doc: "Mat Hold",
      target: "TA_CDLMATHOLD",
      inputs: [
        @open,
        @high,
        @low,
        @close,
        @cdl_penetration
      ],
      outputs: [
        %{name: :list, type: :integer_array}
      ]
    },
    %{
      name: "cdl_morning_doji_star",
      doc: "Morning Doji Star",
      target: "TA_CDLMORNINGDOJISTAR",
      inputs: [
        @open,
        @high,
        @low,
        @close,
        @cdl_penetration
      ],
      outputs: [
        %{name: :list, type: :integer_array}
      ]
    },
    %{
      name: "cdl_morning_star",
      doc: "Morning Star",
      target: "TA_CDLMORNINGSTAR",
      inputs: [
        @open,
        @high,
        @low,
        @close,
        @cdl_penetration
      ],
      outputs: [
        %{name: :list, type: :integer_array}
      ]
    },
    %{
      name: "cdl_on_neck",
      doc: "On-Neck Pattern",
      target: "TA_CDLONNECK",
      inputs: [@open, @high, @low, @close],
      outputs: [
        %{name: :list, type: :integer_array}
      ]
    },
    %{
      name: "cdl_piercing",
      doc: "Piercing Pattern",
      target: "TA_CDLPIERCING",
      inputs: [@open, @high, @low, @close],
      outputs: [
        %{name: :list, type: :integer_array}
      ]
    },
    %{
      name: "cdl_rickshaw_man",
      doc: "Rickshaw Man",
      target: "TA_CDLRICKSHAWMAN",
      inputs: [@open, @high, @low, @close],
      outputs: [
        %{name: :list, type: :integer_array}
      ]
    },
    %{
      name: "cdl_rise_fall_3_methods",
      doc: "Rickshaw Man",
      target: "TA_CDLRISEFALL3METHODS",
      inputs: [@open, @high, @low, @close],
      outputs: [
        %{name: :list, type: :integer_array}
      ]
    },
    %{
      name: "cdl_separating_lines",
      doc: "Separating Lines",
      target: "TA_CDLSEPARATINGLINES",
      inputs: [@open, @high, @low, @close],
      outputs: [
        %{name: :list, type: :integer_array}
      ]
    },
    %{
      name: "cdl_shooting_star",
      doc: "Shooting Star",
      target: "TA_CDLSHOOTINGSTAR",
      inputs: [@open, @high, @low, @close],
      outputs: [
        %{name: :list, type: :integer_array}
      ]
    },
    %{
      name: "cdl_short_line",
      doc: "Short Line Candle",
      target: "TA_CDLSHORTLINE",
      inputs: [@open, @high, @low, @close],
      outputs: [
        %{name: :list, type: :integer_array}
      ]
    },
    %{
      name: "cdl_spinning_top",
      doc: "Spinning Top",
      target: "TA_CDLSPINNINGTOP",
      inputs: [@open, @high, @low, @close],
      outputs: [
        %{name: :list, type: :integer_array}
      ]
    },
    %{
      name: "cdl_stalled_pattern",
      doc: "Stalled Pattern",
      target: "TA_CDLSTALLEDPATTERN",
      inputs: [@open, @high, @low, @close],
      outputs: [
        %{name: :list, type: :integer_array}
      ]
    },
    %{
      name: "cdl_stick_sandwich",
      doc: "Stick Sandwich",
      target: "TA_CDLSTICKSANDWICH",
      inputs: [@open, @high, @low, @close],
      outputs: [
        %{name: :list, type: :integer_array}
      ]
    },
    %{
      name: "cdl_takuri",
      doc: "Takuri (Dragonfly Doji with very long lower shadow)",
      target: "TA_CDLTAKURI",
      inputs: [@open, @high, @low, @close],
      outputs: [
        %{name: :list, type: :integer_array}
      ]
    },
    %{
      name: "cdl_tasuki_gap",
      doc: "Tasuki Gap",
      target: "TA_CDLTASUKIGAP",
      inputs: [@open, @high, @low, @close],
      outputs: [
        %{name: :list, type: :integer_array}
      ]
    },
    %{
      name: "cdl_thrusting",
      doc: "Thrusting Pattern",
      target: "TA_CDLTHRUSTING",
      inputs: [@open, @high, @low, @close],
      outputs: [
        %{name: :list, type: :integer_array}
      ]
    },
    %{
      name: "cdl_tri_star",
      doc: "Tristar Pattern",
      target: "TA_CDLTRISTAR",
      inputs: [@open, @high, @low, @close],
      outputs: [
        %{name: :list, type: :integer_array}
      ]
    },
    %{
      name: "cdl_unique_3_river",
      doc: "Unique 3 River",
      target: "TA_CDLUNIQUE3RIVER",
      inputs: [@open, @high, @low, @close],
      outputs: [
        %{name: :list, type: :integer_array}
      ]
    },
    %{
      name: "cdl_upside_gap_2_crows",
      doc: "Upside Gap Two Crows",
      target: "TA_CDLUPSIDEGAP2CROWS",
      inputs: [@open, @high, @low, @close],
      outputs: [
        %{name: :list, type: :integer_array}
      ]
    },
    %{
      name: "cdl_upside_downside_gap_3_methods",
      doc: "Upside/Downside Gap Three Methods",
      target: "TA_CDLXSIDEGAP3METHODS",
      inputs: [@open, @high, @low, @close],
      outputs: [
        %{name: :list, type: :integer_array}
      ]
    },
    %{
      name: "ceil",
      doc: "Vector Ceil",
      target: "TA_CEIL",
      inputs: [@generic],
      outputs: [@generic_output]
    },
    %{
      name: "cmo",
      doc: "Chande Momentum Oscillator",
      target: "TA_CMO",
      inputs: [@generic, @time_period2],
      outputs: [@generic_output]
    },
    %{
      name: "correl",
      doc: "Pearson's Correlation Coefficient (r)",
      target: "TA_CORREL",
      inputs: [@generic0, @generic1, @time_period1],
      outputs: [@generic_output]
    },
    %{
      name: "cos",
      doc: "Vector Trigonometric Cos",
      target: "TA_COS",
      inputs: [@generic],
      outputs: [@generic_output]
    },
    %{
      name: "cosh",
      doc: "Vector Trigonometric Cosh",
      target: "TA_COSH",
      inputs: [@generic],
      outputs: [@generic_output]
    },
    %{
      name: "dema",
      doc: "Double Exponential Moving Average",
      target: "TA_DEMA",
      inputs: [@generic, @time_period2],
      outputs: [@generic_output]
    },
    %{
      name: "div",
      doc: "Vector Arithmetic Div",
      target: "TA_DIV",
      inputs: [@generic0, @generic1],
      outputs: [@generic_output]
    },
    %{
      name: "dx",
      doc: "Directional Movement Index",
      target: "TA_DX",
      inputs: [@high, @low, @close, @time_period2],
      outputs: [@generic_output]
    },
    %{
      name: "ema",
      doc: "Exponential Moving Average",
      target: "TA_EMA",
      inputs: [@generic, @time_period2],
      outputs: [@generic_output]
    },
    %{
      name: "exp",
      doc: "Vector Arithmetic Exp",
      target: "TA_EXP",
      inputs: [@generic],
      outputs: [@generic_output]
    },
    %{
      name: "floor",
      doc: "Vector Floor",
      target: "TA_FLOOR",
      inputs: [@generic],
      outputs: [@generic_output]
    },
    %{
      name: "ht_dcperiod",
      doc: "Hilbert Transform - Dominant Cycle Period",
      target: "TA_HT_DCPERIOD",
      inputs: [@generic],
      outputs: [@generic_output]
    },
    %{
      name: "ht_dcphase",
      doc: "Hilbert Transform - Dominant Cycle Phase",
      target: "TA_HT_DCPHASE",
      inputs: [@generic],
      outputs: [@generic_output]
    },
    %{
      name: "ht_phasor",
      doc: "Hilbert Transform - Phasor Components",
      target: "TA_HT_PHASOR",
      inputs: [@generic],
      outputs: [
        %{name: :in_phase, type: :double_array},
        %{name: :quadrature, type: :double_array}
      ]
    },
    %{
      name: "ht_sine",
      doc: "Hilbert Transform - SineWave",
      target: "TA_HT_SINE",
      inputs: [@generic],
      outputs: [
        %{name: :sine, type: :double_array},
        %{name: :leadSine, type: :double_array}
      ]
    },
    %{
      name: "ht_trendline",
      doc: "Hilbert Transform - Instantaneous Trendline",
      target: "TA_HT_TRENDLINE",
      inputs: [@generic],
      outputs: [
        %{name: :list, type: :double_array}
      ]
    },
    %{
      name: "ht_trendmode",
      doc: "Hilbert Transform - Trend vs Cycle Mode",
      target: "TA_HT_TRENDMODE",
      inputs: [@generic],
      outputs: [
        %{name: :list, type: :integer_array}
      ]
    },
    %{
      name: "kama",
      doc: "Kaufman Adaptive Moving Average",
      target: "TA_KAMA",
      inputs: [@generic, @time_period2],
      outputs: [@generic_output]
    },
    %{
      name: "linear_reg",
      doc: "Linear Regression",
      target: "TA_LINEARREG",
      inputs: [@generic, @time_period2],
      outputs: [@generic_output]
    },
    %{
      name: "linear_reg_angle",
      doc: "Linear Regression Angle",
      target: "TA_LINEARREG_ANGLE",
      inputs: [@generic, @time_period2],
      outputs: [@generic_output]
    },
    %{
      name: "linear_reg_intercept",
      doc: "Linear Regression Intercept",
      target: "TA_LINEARREG_INTERCEPT",
      inputs: [@generic, @time_period2],
      outputs: [@generic_output]
    },
    %{
      name: "linear_reg_slope",
      doc: "Linear Regression Slope",
      target: "TA_LINEARREG_SLOPE",
      inputs: [@generic, @time_period2],
      outputs: [@generic_output]
    },
    %{
      name: "ln",
      doc: "Vector Log Natural",
      target: "TA_LN",
      inputs: [@generic],
      outputs: [@generic_output]
    },
    %{
      name: "log10",
      doc: "Vector Log10",
      target: "TA_LOG10",
      inputs: [@generic],
      outputs: [@generic_output]
    },
    %{
      name: "ma",
      doc: "Moving average",
      target: "TA_MA",
      inputs: [@generic, @time_period2, @moving_average_type],
      outputs: [@generic_output]
    },
    %{
      name: "macd",
      doc: "Moving Average Convergence/Divergence",
      target: "TA_MACD",
      inputs: [
        @generic,
        @fast_period,
        @slow_period,
        @signal_period
      ],
      outputs: [
        %{name: :macd, type: :double_array},
        %{name: :macd_signal, type: :double_array},
        %{name: :macd_hist, type: :double_array}
      ]
    },
    %{
      name: "macdext",
      doc: "MACD with controllable MA type",
      target: "TA_MACDEXT",
      inputs: [
        @generic,
        @fast_period,
        %{@moving_average_type | name: :fast_moving_average_type},
        @slow_period,
        %{@moving_average_type | name: :slow_moving_average_type},
        @signal_period,
        %{@moving_average_type | name: :single_moving_average_type}
      ],
      outputs: [
        %{name: :macd, type: :double_array},
        %{name: :macd_signal, type: :double_array},
        %{name: :macd_hist, type: :double_array}
      ]
    },
    %{
      name: "macdfix",
      doc: "Moving Average Convergence/Divergence Fix 12/26",
      target: "TA_MACDFIX",
      inputs: [
        @generic,
        @signal_period
      ],
      outputs: [
        %{name: :macd, type: :double_array},
        %{name: :macd_signal, type: :double_array},
        %{name: :macd_hist, type: :double_array}
      ]
    },
    %{
      name: "mama",
      doc: "MESA Adaptive Moving Average",
      target: "TA_MAMA",
      inputs: [@generic, @fast_limit, @slow_limit],
      outputs: [
        %{name: :mama, type: :double_array},
        %{name: :fama, type: :double_array}
      ]
    },
    %{
      name: "mavp",
      doc: "Moving average with variable period",
      target: "TA_MAVP",
      inputs: [
        @generic,
        %{@generic | name: :periods},
        @min_period,
        @max_period,
        @moving_average_type
      ],
      outputs: [
        %{name: :list, type: :double_array}
      ]
    },
    %{
      name: "max",
      doc: "Highest value over a specified period",
      target: "TA_MAX",
      inputs: [@generic, @time_period2],
      outputs: [@generic_output]
    },
    %{
      name: "max_index",
      doc: "Index of highest value over a specified period",
      target: "TA_MAXINDEX",
      inputs: [@generic, @time_period2],
      outputs: [%{name: :list, type: :integer_array}]
    },
    %{
      name: "med_price",
      doc: "Median Price",
      target: "TA_MEDPRICE",
      inputs: [@high, @low],
      outputs: [@generic_output]
    },
    %{
      name: "mfi",
      doc: "Money Flow Index",
      target: "TA_MFI",
      inputs: [@high, @low, @close, @volume, @time_period2],
      outputs: [@generic_output]
    },
    %{
      name: "mid_point",
      doc: "MidPoint over period",
      target: "TA_MIDPOINT",
      inputs: [@generic, @time_period2],
      outputs: [@generic_output]
    },
    %{
      name: "mid_price",
      doc: "Midpoint Price over period",
      target: "TA_MIDPRICE",
      inputs: [@high, @low, @time_period2],
      outputs: [@generic_output]
    },
    %{
      name: "min",
      doc: "Lowest value over a specified period",
      target: "TA_MIN",
      inputs: [@generic, @time_period2],
      outputs: [@generic_output]
    },
    %{
      name: "min_index",
      doc: "Index of lowest value over a specified period",
      target: "TA_MININDEX",
      inputs: [@generic, @time_period2],
      outputs: [%{name: :list, type: :integer_array}]
    },
    %{
      name: "min_max",
      doc: "Lowest and highest values over a specified period",
      target: "TA_MINMAX",
      inputs: [@generic, @time_period2],
      outputs: [
        %{name: :min, type: :double_array},
        %{name: :max, type: :double_array}
      ]
    },
    %{
      name: "min_max_index",
      doc: "Indexes of lowest and highest values over a specified period",
      target: "TA_MINMAXINDEX",
      inputs: [@generic, @time_period2],
      outputs: [
        %{name: :min, type: :integer_array},
        %{name: :max, type: :integer_array}
      ]
    },
    %{
      name: "minus_di",
      doc: "Minus Directional Indicator",
      target: "TA_MINUS_DI",
      inputs: [@high, @low, @close, @time_period1],
      outputs: [
        %{name: :list, type: :double_array}
      ]
    },
    %{
      name: "minus_dm",
      doc: "Minus Directional Movement",
      target: "TA_MINUS_DM",
      inputs: [@high, @low, @time_period1],
      outputs: [
        %{name: :list, type: :double_array}
      ]
    },
    %{
      name: "mom",
      doc: "Momentum",
      target: "TA_MOM",
      inputs: [@generic, @time_period1],
      outputs: [
        %{name: :list, type: :double_array}
      ]
    },
    %{
      name: "mult",
      doc: "Vector Arithmetic Mult",
      target: "TA_MULT",
      inputs: [@generic0, @generic1],
      outputs: [@generic_output]
    },
    %{
      name: "natr",
      doc: "Normalized Average True Range",
      target: "TA_NATR",
      inputs: [@high, @low, @close, @time_period1],
      outputs: [@generic_output]
    },
    %{
      name: "obv",
      doc: "On Balance Volume",
      target: "TA_OBV",
      inputs: [@generic, @volume],
      outputs: [@generic_output]
    },
    %{
      name: "plus_di",
      doc: "Plus Directional Indicator",
      target: "TA_PLUS_DI",
      inputs: [@high, @low, @close, @time_period1],
      outputs: [@generic_output]
    },
    %{
      name: "plus_dm",
      doc: "Plus Directional Movement",
      target: "TA_PLUS_DM",
      inputs: [@high, @low, @time_period1],
      outputs: [@generic_output]
    },
    %{
      name: "ppo",
      doc: "Percentage Price Oscillator",
      target: "TA_PPO",
      inputs: [@generic, @fast_period, @slow_period, @moving_average_type],
      outputs: [@generic_output]
    },
    %{
      name: "roc",
      doc: "Rate of change : ((price/prevPrice)-1)*100",
      target: "TA_ROC",
      inputs: [@generic, @time_period1],
      outputs: [@generic_output]
    },
    %{
      name: "rocp",
      doc: "Rate of change Percentage: (price-prevPrice)/prevPrice",
      target: "TA_ROCP",
      inputs: [@generic, @time_period1],
      outputs: [@generic_output]
    },
    %{
      name: "rocr",
      doc: "Rate of change ratio: (price/prevPrice)",
      target: "TA_ROCR",
      inputs: [@generic, @time_period1],
      outputs: [@generic_output]
    },
    %{
      name: "rocr100",
      doc: "Rate of change ratio 100 scale: (price/prevPrice)*100",
      target: "TA_ROCR100",
      inputs: [@generic, @time_period1],
      outputs: [@generic_output]
    },
    %{
      name: "rsi",
      doc: "Relative Strength Index",
      target: "TA_RSI",
      inputs: [@generic, @time_period2],
      outputs: [@generic_output]
    },
    %{
      name: "sar",
      doc: "Parabolic SAR",
      target: "TA_SAR",
      inputs: [
        @high,
        @low,
        %{
          name: :acceleration,
          type: :double,
          min: 0,
          default: 0,
          doc: "Acceleration Factor used up to the Maximum value"
        },
        %{
          name: :maximum,
          type: :double,
          min: 0,
          default: 0,
          doc: "Acceleration Factor Maximum value"
        }
      ],
      outputs: [@generic_output]
    },
    %{
      name: "sarext",
      doc: "Parabolic SAR - Extended",
      target: "TA_SAREXT",
      inputs: [
        @high,
        @low,
        %{
          name: :start_value,
          type: :double,
          default: 0,
          doc: "Start value and direction. 0 for Auto, >0 for Long, <0 for Short"
        },
        %{
          name: :offset_on_reverse,
          type: :double,
          min: 0,
          default: 0,
          doc: "Percent offset added/removed to initial stop on short/long reversal"
        },
        %{
          name: :acceleration_init_long,
          type: :double,
          min: 0,
          default: 0,
          doc: "Acceleration Factor initial value for the Long direction"
        },
        %{
          name: :acceleration_long,
          type: :double,
          min: 0,
          default: 0,
          doc: "Acceleration Factor for the Long direction"
        },
        %{
          name: :acceleration_max_long,
          type: :double,
          min: 0,
          default: 0,
          doc: "Acceleration Factor maximum value for the Long direction"
        },
        %{
          name: :acceleration_init_short,
          type: :double,
          min: 0,
          default: 0,
          doc: "Acceleration Factor initial value for the Short direction"
        },
        %{
          name: :acceleration_short,
          type: :double,
          min: 0,
          default: 0,
          doc: "Acceleration Factor for the Short direction"
        },
        %{
          name: :acceleration_max_short,
          type: :double,
          min: 0,
          default: 0,
          doc: "Acceleration Factor maximum value for the Short direction"
        }
      ],
      outputs: [@generic_output]
    },
    %{
      name: "sin",
      doc: "Vector Trigonometric Sin",
      target: "TA_SIN",
      inputs: [@generic],
      outputs: [@generic_output]
    },
    %{
      name: "sinh",
      doc: "Vector Trigonometric Sinh",
      target: "TA_SINH",
      inputs: [@generic],
      outputs: [@generic_output]
    },
    %{
      name: "sma",
      doc: "Simple Moving Average",
      target: "TA_SMA",
      inputs: [@generic, @time_period2],
      outputs: [@generic_output]
    },
    %{
      name: "sqrt",
      doc: "Vector Square Root",
      target: "TA_SQRT",
      inputs: [@generic],
      outputs: [@generic_output]
    },
    %{
      name: "stddev",
      doc: "Standard Deviation",
      target: "TA_STDDEV",
      inputs: [
        @generic,
        @time_period2,
        %{
          name: :number_of_deviations,
          type: :double,
          doc: "Number of deviations"
        }
      ],
      outputs: [@generic_output]
    },
    %{
      name: "stoch",
      doc: "Stochastic",
      target: "TA_STOCH",
      inputs: [
        @high,
        @low,
        @close,
        %{
          name: :fast_k_period,
          min: 1,
          max: 100_000,
          type: :integer,
          doc: "Time period for building the Fast-K line"
        },
        %{
          name: :slow_k_period,
          min: 1,
          max: 100_000,
          type: :integer,
          doc: "Smoothing for making the Slow-K line. Usually set to 3"
        },
        %{
          @moving_average_type
          | name: :slow_k_moving_average_type,
            doc: "Type of Moving Average for Slow-K"
        },
        %{
          name: :slow_d_period,
          min: 1,
          max: 100_000,
          type: :integer,
          doc: "Smoothing for making the Slow-D line"
        },
        %{
          @moving_average_type
          | name: :slow_d_moving_average_type,
            doc: "Type of Moving Average for Slow-K"
        }
      ],
      outputs: [
        %{name: :slow_k, type: :double_array},
        %{name: :slow_d, type: :double_array}
      ]
    },
    %{
      name: "stochf",
      doc: "Stochastic Fast",
      target: "TA_STOCHF",
      inputs: [
        @high,
        @low,
        @close,
        %{
          name: :fast_k_period,
          min: 1,
          max: 100_000,
          type: :integer,
          doc: "Time period for building the Fast-K line"
        },
        %{
          name: :fast_d_period,
          min: 1,
          max: 100_000,
          type: :integer,
          doc: "Smoothing for making the Fast-D line. Usually set to 3"
        },
        %{
          @moving_average_type
          | name: :fast_d_moving_average_type,
            doc: "Type of Moving Average for Fast-D"
        }
      ],
      outputs: [
        %{name: :fast_k, type: :double_array},
        %{name: :fast_d, type: :double_array}
      ]
    },
    %{
      name: "stochrsi",
      doc: "Stochastic Relative Strength Index",
      target: "TA_STOCHRSI",
      inputs: [
        @generic,
        @time_period2,
        %{
          name: :fast_k_period,
          min: 1,
          max: 100_000,
          type: :integer,
          doc: "Time period for building the Fast-K line"
        },
        %{
          name: :fast_d_period,
          min: 1,
          max: 100_000,
          type: :integer,
          doc: "Smoothing for making the Fast-D line. Usually set to 3"
        },
        %{
          @moving_average_type
          | name: :fast_d_moving_average_type,
            doc: "Type of Moving Average for Fast-D"
        }
      ],
      outputs: [
        %{name: :fast_k, type: :double_array},
        %{name: :fast_d, type: :double_array}
      ]
    },
    %{
      name: "sub",
      doc: "Vector Arithmetic Substraction",
      target: "TA_SUB",
      inputs: [@generic0, @generic1],
      outputs: [@generic_output]
    },
    %{
      name: "sum",
      doc: "Summation",
      target: "TA_SUM",
      inputs: [@generic, @time_period2],
      outputs: [@generic_output]
    },
    %{
      name: "t3",
      doc: "Triple Exponential Moving Average (T3)",
      target: "TA_T3",
      inputs: [
        @generic,
        @time_period2,
        %{
          name: :v_factor,
          type: :double,
          min: 0,
          max: 1,
          doc: "Volume Factor"
        }
      ],
      outputs: [@generic_output]
    },
    %{
      name: "tan",
      doc: "Vector Trigonometric Tan",
      target: "TA_TAN",
      inputs: [@generic],
      outputs: [@generic_output]
    },
    %{
      name: "tanh",
      doc: "Vector Trigonometric Tanh",
      target: "TA_TANH",
      inputs: [@generic],
      outputs: [@generic_output]
    },
    %{
      name: "tema",
      doc: "Triple Exponential Moving Average",
      target: "TA_TEMA",
      inputs: [@generic, @time_period2],
      outputs: [@generic_output]
    },
    %{
      name: "trange",
      doc: "True Range",
      target: "TA_TRANGE",
      inputs: [@high, @low, @close],
      outputs: [@generic_output]
    },
    %{
      name: "trima",
      doc: "Triangular Moving Average",
      target: "TA_TRIMA",
      inputs: [@generic, @time_period2],
      outputs: [@generic_output]
    },
    %{
      name: "trix",
      doc: "1-day Rate-Of-Change (ROC) of a Triple Smooth EMA",
      target: "TA_TRIX",
      inputs: [@generic, @time_period1],
      outputs: [@generic_output]
    },
    %{
      name: "tsf",
      doc: "Time Series Forecast",
      target: "TA_TSF",
      inputs: [@generic, @time_period2],
      outputs: [@generic_output]
    },
    %{
      name: "typprice",
      doc: "Typical Price",
      target: "TA_TYPPRICE",
      inputs: [@high, @low, @close],
      outputs: [@generic_output]
    },
    %{
      name: "ultosc",
      doc: "Ultimate Oscillator",
      target: "TA_ULTOSC",
      inputs: [
        @high,
        @low,
        @close,
        %{
          name: :time_period1,
          doc: "Number of bars for 1st period",
          min: 1,
          max: 100_000,
          type: :integer
        },
        %{
          name: :time_period2,
          doc: "Number of bars for 2nd period",
          min: 1,
          max: 100_000,
          type: :integer
        },
        %{
          name: :time_period3,
          doc: "Number of bars for 3rd period",
          min: 1,
          max: 100_000,
          type: :integer
        }
      ],
      outputs: [@generic_output]
    },
    %{
      name: "var",
      doc: "Variance",
      target: "TA_VAR",
      inputs: [
        @generic,
        @time_period1,
        %{
          name: :number_of_deviations,
          type: :double,
          doc: "Number of deviations"
        }
      ],
      outputs: [@generic_output]
    },
    %{
      name: "wclprice",
      doc: "Weighted Close Price",
      target: "TA_WCLPRICE",
      inputs: [@high, @low, @close],
      outputs: [@generic_output]
    },
    %{
      name: "willr",
      doc: "Williams' %R",
      target: "TA_WILLR",
      inputs: [@high, @low, @close, @time_period2],
      outputs: [@generic_output]
    },
    %{
      name: "wma",
      doc: "Weighted Moving Average",
      target: "TA_WMA",
      inputs: [@generic, @time_period2],
      outputs: [@generic_output]
    }
  ]

  def mapping, do: @mapping
end

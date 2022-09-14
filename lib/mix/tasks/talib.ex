defmodule Mix.Tasks.Talib do
  @moduledoc "Generate c code fo ta-lib nif"
  @shortdoc "Generate c code fo ta-lib nif"

  use Mix.Task
  @c_dir Path.join([__DIR__, "..", "..", "..", "c_src"]) |> Path.expand()
  @module_dir Path.join([__DIR__, "..", ".."]) |> Path.expand()
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
  @cdl_pentration %{
    name: :pentration,
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
        @cdl_pentration
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
        %{name: :peneration, type: :double}
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
        %{name: :peneration, type: :double}
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
        %{name: :peneration, type: :double}
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
        @cdl_pentration
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
        @cdl_pentration
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
        @cdl_pentration
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
        %{name: :list, type: :integer_array}
      ]
    },
    %{
      name: "minus_dm",
      doc: "Minus Directional Movement",
      target: "TA_MINUS_DM",
      inputs: [@high, @low, @time_period1],
      outputs: [
        %{name: :list, type: :integer_array}
      ]
    },
    %{
      name: "mom",
      doc: "Momentum",
      target: "TA_MOM",
      inputs: [@generic, @time_period1],
      outputs: [
        %{name: :list, type: :integer_array}
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
  @impl Mix.Task
  def run(_args \\ []) do
    {bindings, headers, nif_functions, elixir_functions} =
      Enum.reduce(
        @mapping,
        {[], [], [], []},
        fn func, {bindings, headers, nif_functions, elixir_functions} ->
          %{
            name: name,
            binding: binding,
            content: content,
            header: header,
            nif_function: nif_function,
            elixir_function: elixir_function
          } = build_function(func)

          @c_dir
          |> Path.join("func_#{name}.c")
          |> write_file(content)

          {[binding | bindings], [header | headers], [nif_function | nif_functions],
           [elixir_function | elixir_functions]}
        end
      )

    bindings |> Enum.reverse() |> generate_bindings()
    headers |> Enum.reverse() |> generate_headers()
    nif_functions |> Enum.reverse() |> generate_nif_module()
    elixir_functions |> Enum.reverse() |> generate_elixir_module()
  end

  defp generate_headers(headers) do
    content = """
    #ifndef TALIBEX_FUNCTIONS_H
    #define TALIBEX_FUNCTIONS_H

    #include "erl_nif.h"

    #{Enum.join(headers, "\n")}

    #endif
    """

    @c_dir
    |> Path.join("funcs.h")
    |> write_file(content)
  end

  defp build_function(%{name: name, doc: doc, target: target, inputs: inputs, outputs: outputs}) do
    vars = declare_inputs(inputs)
    inputs_length = length(inputs)
    outputs_length = length(outputs)

    elixir_function =
      build_elixir_function(%{
        name: name,
        doc: doc,
        outputs: outputs,
        inputs: inputs,
        inputs_length: inputs_length,
        outputs_length: outputs_length,
        target: target
      })

    outputs = declare_outputs(outputs)

    content =
      build_c_function(%{
        name: name,
        vars: vars,
        outputs: outputs,
        inputs_length: inputs_length,
        outputs_length: outputs_length,
        target: target
      })

    binding = ~s[{"nif_#{name}", #{inputs_length}, ex_#{name}, 0}]

    header = """
    ERL_NIF_TERM
    ex_#{name}(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[]);
    """

    args = Stream.repeatedly(fn -> "_" end) |> Enum.take(inputs_length) |> Enum.join(", ")

    nif_function = """
    def nif_#{name}(#{args}) do
      raise "nif_#{name}/#{inputs_length} not implemented end"
    end
    """

    %{
      binding: binding,
      content: content,
      header: header,
      name: name,
      elixir_function: elixir_function,
      nif_function: nif_function
    }
  end

  def build_elixir_function(%{
        name: name,
        doc: doc,
        outputs: outputs,
        inputs: inputs,
        inputs_length: inputs_length,
        target: target
      }) do
    name = String.trim(name)

    inputs_spec =
      Enum.map(inputs, fn
        %{name: name, type: :double_array} ->
          "{:#{name}, [number()]}"

        %{name: name, type: :integer} ->
          "{:#{name}, pos_integer()}"

        %{name: name, type: :ma_type} ->
          "{:#{name}, :sma | :ema | :wma | :dema | :tema | :trima | :kama | :mama | :t3}"

        %{name: name, type: :double} ->
          "{:#{name}, number()}"
      end)

    loaded_inputs =
      Enum.map(inputs, &"|> Executer.load(:#{&1.name},:#{&1.type} #{executer_params(&1)})\n")

    outputs_spec =
      Enum.map(outputs, fn
        %{name: name, type: :double_array} ->
          "#{name} :: [number()|:nan]"

        %{name: name, type: :integer_array} ->
          "#{name} :: [integer()|:nan]"
      end)

    input_docs = Enum.map_join(inputs, "\n", &describe_input/1)
    output_docs = Enum.map_join(outputs, "\n", &describe_output/1)

    """
    @dialyzer {:nowarn_function, #{name}: 1}
    @spec #{name}([#{Enum.join(inputs_spec, "| ")}]) :: {:ok, #{Enum.join(outputs_spec, ", ")}} | {:error,term()}
    @doc \"\"\"
    #{doc}

    ---
    Inputs
    #{input_docs}

    ---
    Outputs
    #{output_docs}

    ---
    TA-LIB src `#{target}`
    \"\"\"
    def #{name}(params) do
      params
      |> Executer.new()
      #{loaded_inputs}
      |> Executer.call(&Nif.nif_#{name}/#{inputs_length})
    end
    """
  end

  defp executer_params(%{min: min, max: max, default: default}),
    do: ", %{default: #{inspect(default)}, min: #{min}, max: #{max}}"

  defp executer_params(%{min: min, max: max}), do: ", %{min: #{min}, max: #{max}}"

  defp executer_params(%{min: min, default: default}),
    do: ", %{default: #{inspect(default)}, min: #{min}}"

  defp executer_params(%{min: min}), do: ", %{min: #{min}}"

  defp executer_params(%{default: default}),
    do: ", %{default: #{inspect(default)}}"

  defp executer_params(_), do: ""

  defp describe_input(%{name: name} = input) do
    min = Map.get(input, :min)
    max = Map.get(input, :max)
    default = Map.get(input, :default)
    doc = Map.get(input, :doc)

    "- `#{name}`"
    |> then(fn
      value when not is_nil(default) -> "#{value} (default `#{inspect(default)}`)"
      value -> value
    end)
    |> then(fn
      value when not is_nil(doc) -> "#{value}: #{doc}"
      value -> value
    end)
    |> then(fn
      value when not is_nil(min) and not is_nil(max) -> "#{value} (between `#{min}` and `#{max}`)"
      value when not is_nil(min) -> "#{value} (minuimum `#{min}`)"
      value when not is_nil(max) -> "#{value} (maximum `#{max}`)"
      value -> value
    end)
  end

  defp describe_output(%{name: name, doc: doc}), do: "- `#{name}`: #{doc}"
  defp describe_output(%{name: name}), do: "- `#{name}`"

  def build_c_function(%{
        name: name,
        vars: vars,
        outputs: outputs,
        inputs_length: inputs_length,
        outputs_length: outputs_length,
        target: target
      }) do
    """
    #include "erl_nif.h"
    #include "util.h"
    #include "ta_libc.h"
    #include "funcs.h"
    #include <stdbool.h>

    ERL_NIF_TERM
    ex_#{name}(ErlNifEnv *env, int argc, const ERL_NIF_TERM argv[])
    {
      talib_st *atoms =  enif_priv_data(env);
      int startIdx = 0;
      int endIdx = 0;
      unsigned inLen = 0;
      unsigned tmpLen = 0;
      int outBegIdx;
      int outNBElement;
      TA_RetCode retCode;
      TA_RetCodeInfo info;
      ERL_NIF_TERM results;
    #{Enum.map_join(vars, "\n", & &1.typec)}
    #{Enum.map_join(outputs, "\n", & &1.typec)}
      if (argc != #{inputs_length})
      {
        return enif_make_tuple2(env, atoms->atom_error, enif_make_string(env, "should be called with #{inputs_length}", ERL_NIF_LATIN1));
      }
    #{Enum.map_join(vars, "\n", & &1.declare)}
    #{Enum.map_join(outputs, "\n", & &1.declare)}

      /* call TA-Lib function */
      retCode = #{target}(
          startIdx,
          endIdx,
          #{Enum.map_join(vars, ",\n      ", & &1.name)},
          &outBegIdx,
          &outNBElement,
          #{Enum.map_join(outputs, ",\n      ", &"&#{&1.binding}")});

      /* generate results */
      if (retCode != TA_SUCCESS)
      {
          /* generate error message */
          TA_SetRetCodeInfo(retCode, &info);
          results = enif_make_tuple2(env, atoms->atom_error, enif_make_string(env, info.infoStr, ERL_NIF_LATIN1));
      }
      else
      {
        results = enif_make_tuple#{outputs_length + 1}(
          env,
          atoms->atom_ok,
    #{Enum.map_join(outputs, ",\n", & &1.load)}
        );
      }
      /* clean up */
    #{destroy_inputs(vars)}
    #{Enum.map_join(outputs, "\n", & &1.destroy)}

      /* return the results; */
      return results;
    }
    """
  end

  defp destroy_inputs(vars), do: Enum.map_join(vars, "\n", & &1.destroy)
  defp declare_inputs(inputs, vars \\ [], pos \\ 0)
  defp declare_inputs([], vars, _), do: Enum.reverse(vars)

  defp declare_inputs([input | inputs], vars, pos),
    do: declare_inputs(inputs, [declare_input(input, pos, vars) | vars], pos + 1)

  defp declare_input(%{type: :integer, name: input_name}, pos, prev_vars) do
    name = "input#{pos}"

    destroy = ""

    %{
      typec: "  int #{name};",
      declare: """
        if (!enif_is_number(env, argv[#{pos}]))
        {
          #{destroy_inputs(prev_vars)}
          return enif_make_tuple2(env, atoms->atom_error, enif_make_string(env, "#{input_name} should be an integer", ERL_NIF_LATIN1));
        }
        enif_get_int(env, argv[#{pos}], &#{name});
      """,
      destroy: destroy,
      name: name
    }
  end

  defp declare_input(%{type: :double, name: input_name}, pos, prev_vars) do
    name = "input#{pos}"

    destroy = ""

    %{
      typec: "  double #{name};",
      declare: """
        if (!enif_is_number(env, argv[#{pos}]))
        {
          #{destroy_inputs(prev_vars)}
          return enif_make_tuple2(env, atoms->atom_error, enif_make_string(env, "#{input_name} should be an double", ERL_NIF_LATIN1));
        }
        enif_get_double(env, argv[#{pos}], &#{name});
      """,
      destroy: destroy,
      name: name
    }
  end

  defp declare_input(%{type: :ma_type}, pos, _prev_vars) do
    name = "input#{pos}"

    destroy = ""

    %{
      type: :ma_type,
      typec: "  TA_MAType #{name};",
      declare: """
        load_moving_average_type(argv[#{pos}], atoms, &#{name});
      """,
      destroy: destroy,
      name: name
    }
  end

  defp declare_input(%{type: :double_array, name: input_name}, pos, prev_vars) do
    name = "input#{pos}"

    destroy = """
      if (#{name} != NULL)
      {
        enif_free(#{name});
        #{name} = NULL;
      }
    """

    check =
      if Enum.any?(prev_vars, &(&1.type == :double_array)) do
        """
          if (inLen != 0 && tmpLen != inLen)
          {
            #{destroy_inputs(prev_vars)}
            return enif_make_tuple2(env, atoms->atom_error, enif_make_string(env, "#{input_name} is a list with different length", ERL_NIF_LATIN1));
          }
        """
      else
        """
          if (tmpLen == 0)
          {
            #{destroy_inputs(prev_vars)}
            return enif_make_tuple2(env, atoms->atom_error, enif_make_string(env, "#{input_name} is an empty list", ERL_NIF_LATIN1));
          }

          inLen = tmpLen;
          endIdx = tmpLen - 1;
        """
      end

    %{
      type: :double_array,
      typec: "  double *#{name};",
      declare: """
        if (!enif_is_list(env, argv[#{pos}]))
        {
        #{destroy_inputs(prev_vars)}
          return enif_make_tuple2(env, atoms->atom_error, enif_make_string(env, "#{input_name} should be a list", ERL_NIF_LATIN1));
        }

        #{name} = construct_array_from_list(env, argv[#{pos}], &tmpLen);
      #{check}
      """,
      destroy: destroy,
      name: name
    }
  end

  defp declare_outputs(inputs, vars \\ [], pos \\ 0)
  defp declare_outputs([], vars, _), do: Enum.reverse(vars)

  defp declare_outputs([input | inputs], vars, pos),
    do: declare_outputs(inputs, [declare_output(input, pos, vars) | vars], pos + 1)

  defp declare_output(%{type: :double_array}, pos, _prev_vars) do
    name = "out#{pos}"

    %{
      type: :double_array,
      typec: "  double *#{name};",
      declare: """
      #{name} = (double *)enif_alloc((inLen) * sizeof(double));

      """,
      load: "      populate_output_double(env, atoms, outBegIdx, inLen, 0, #{name})",
      name: name,
      binding: "#{name}[0]",
      destroy: """
        if (#{name} != NULL)
        {
          enif_free(#{name});
          #{name} = NULL;
        }
      """
    }
  end

  defp declare_output(%{type: :integer_array}, pos, _prev_vars) do
    name = "out#{pos}"

    %{
      type: :double_array,
      typec: "  int *#{name};",
      declare: """
      #{name} = (int *)enif_alloc((inLen) * sizeof(int));

      """,
      load: "      populate_output_int(env, atoms, outBegIdx, inLen, 0, #{name})",
      name: name,
      binding: "#{name}[0]",
      destroy: """
        if (#{name} != NULL)
        {
          enif_free(#{name});
          #{name} = NULL;
        }
      """
    }
  end

  defp generate_bindings(bindings) do
    content = """
    #include "erl_nif.h"
    #include "util.h"
    #include "funcs.h"
    #include <stdbool.h>

    static int
    load(ErlNifEnv *env, void **priv, ERL_NIF_TERM info)
    {
         talib_st *st = enif_alloc(sizeof(talib_st));
         if (st == NULL)
         {
              return 1;
         }

         st->atom_nan = make_atom(env, "nan");
         st->atom_ok = make_atom(env, "ok");
         st->atom_error = make_atom(env, "error");
         st->atom_sma = make_atom(env, "sma");
         st->atom_ema = make_atom(env, "ema");
         st->atom_wma = make_atom(env, "wma");
         st->atom_dema = make_atom(env, "dema");
         st->atom_tema = make_atom(env, "tema");
         st->atom_trima = make_atom(env, "trima");
         st->atom_kama = make_atom(env, "kama");
         st->atom_mama = make_atom(env, "mama");
         st->atom_t3 = make_atom(env, "t3");

         *priv = (void *)st;

         return 0;
    }

    static int
    reload(ErlNifEnv *env, void **priv, ERL_NIF_TERM info)
    {
         return 0;
    }

    static int
    upgrade(ErlNifEnv *env, void **priv, void **old_priv, ERL_NIF_TERM info)
    {
         return load(env, priv, info);
    }

    static void
    unload(ErlNifEnv *env, void *priv)
    {
         enif_free(priv);
         return;
    }

    static ErlNifFunc funcs[] = {
      #{Enum.join(bindings, ", \n")}
    };


    ERL_NIF_INIT(Elixir.TalibEx.Nif, funcs, &load, &reload, &upgrade, &unload)
    """

    @c_dir
    |> Path.join("talib.c")
    |> write_file(content)
  end

  def generate_nif_module(nif_functions) do
    content =
      """
          defmodule TalibEx.Nif do
            @moduledoc false
            @on_load :load_nifs

            def load_nifs do
              :talib_ex
              |> :code.priv_dir()
              |> Path.join("talib")
              |> :erlang.load_nif(0)
            end

            #{Enum.join(nif_functions, "\n")}
          end
      """
      |> Code.format_string!()
      |> to_string()

    @module_dir
    |> Path.join("nif.ex")
    |> write_file(content)
  end

  def generate_elixir_module(functions) do
    content =
      ~s[
        defmodule TalibEx do
          @moduledoc """
          Interface for talib
          """
          alias TalibEx.{Nif, Executer}

          #{Enum.join(functions, "\n")}
        end
      ]
      |> Code.format_string!()
      |> to_string()

    @module_dir
    |> Path.join("talib_ex.ex")
    |> write_file(content)
  end

  defp write_file(path, content) do
    if !File.exists?(path) do
      File.write!(path, content)
    else
      prev = File.read!(path)

      unless String.equivalent?(prev, content) do
        File.write!(path, content)
      end
    end
  end
end

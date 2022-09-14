defmodule TalibExTest do
  use ExUnit.Case, async: true
  doctest TalibEx

  @ohlcv [
    open: [
      76.09,
      76.14,
      76.75,
      77.1,
      77.26,
      78.28,
      77.69,
      78.06,
      78.09,
      78.72,
      78.02,
      78.49,
      79.56,
      79.47,
      79.32,
      79,
      78.88,
      78.88,
      78.74,
      78.25,
      78.89,
      79.13,
      79.55,
      78.72,
      78.7,
      78.74,
      77.4,
      77.8,
      78.41,
      78.74,
      79.73,
      79.83,
      80
    ],
    high: [
      76.44,
      76.84,
      77.06,
      77.34,
      77.96,
      78.32,
      78.11,
      78.25,
      78.14,
      78.72,
      78.47,
      79.47,
      79.69,
      79.54,
      79.41,
      79.25,
      79,
      79.36,
      79.21,
      79.09,
      79.72,
      79.76,
      79.72,
      79.51,
      79.35,
      78.81,
      77.44,
      78.79,
      79.29,
      79.79,
      80.11,
      80.42,
      80.87
    ],
    low: [
      75.54,
      75.93,
      76.73,
      76.05,
      77.23,
      77.92,
      77.59,
      77.85,
      77.64,
      77.67,
      77.98,
      78.33,
      79.36,
      78.95,
      78.46,
      78.57,
      78.4,
      78.85,
      78.59,
      78,
      78.85,
      79.06,
      78.3,
      78.65,
      78.67,
      77.19,
      76.35,
      77.79,
      78.4,
      78.68,
      79.38,
      79.79,
      79.95
    ],
    close: [
      75.9,
      76.71,
      76.84,
      76.93,
      77.83,
      78.21,
      78.06,
      78.01,
      78.06,
      77.85,
      78.37,
      79.31,
      79.5,
      78.98,
      78.83,
      78.83,
      78.56,
      79.17,
      79.07,
      78.88,
      79.68,
      79.65,
      78.72,
      79.4,
      78.74,
      77.22,
      76.98,
      78.61,
      79.23,
      79.79,
      79.48,
      80.38,
      80.84
    ],
    volume: [
      27_209_900,
      27_118_600,
      17_809_700,
      27_715_100,
      25_141_500,
      27_604_400,
      28_132_900,
      18_310_700,
      16_763_000,
      25_704_300,
      27_174_300,
      31_645_300,
      26_280_900,
      26_181_500,
      30_305_000,
      21_871_300,
      22_723_600,
      22_406_900,
      24_896_000,
      27_997_900,
      33_024_100,
      25_466_800,
      42_970_800,
      22_852_700,
      20_227_100,
      43_494_500,
      64_489_900,
      47_812_400,
      25_214_100,
      31_438_600,
      38_446_600,
      46_661_000,
      31_916_600
    ]
  ]

  describe "acos/1" do
    test "should return a list" do
      assert {:ok,
              [
                0.0,
                1.0471975511965976,
                0.0,
                1.0471975511965976,
                1.3694384060045657,
                1.266103672779499,
                1.0471975511965976,
                0.6435011087932843,
                0.45102681179626236,
                1.0471975511965976
              ]} = TalibEx.acos([1, 0.5, 1, 0.5, 0.2, 0.3, 0.5, 0.8, 0.9, 0.5])
    end
  end

  describe "ad/1" do
    test "should return a list" do
      assert {
               :ok,
               [
                 -5_441_979.999999828,
                 13_928_448.571428139,
                 7_991_881.904761473,
                 18_089_631.517164804,
                 34_276_624.66784992,
                 46_698_604.667849675,
                 69_421_331.59092686,
                 65_759_191.59092764,
                 77_158_031.59092775,
                 60_266_634.44807027,
                 76_349_383.42766263,
                 99_111_792.19959265,
                 95_129_837.65413831,
                 71_610_863.07786721,
                 64_911_863.07786743,
                 59_765_674.84257348,
                 49_161_328.175906666,
                 54_872_890.92100507,
                 68_525_536.08229516,
                 85_735_254.43091865,
                 115_722_655.58034456,
                 133_185_604.1517732,
                 115_634_150.63064651,
                 132_640_811.09576282,
                 116_578_114.03693894,
                 74_694_521.4443464,
                 84_752_579.24251245,
                 115_352_515.2425118,
                 137_166_961.3099274,
                 168_605_561.3099274,
                 140_692_276.3784214,
                 181_428_070.02921408,
                 211_263_152.63790965
               ]
             } = TalibEx.ad(@ohlcv)
    end
  end

  describe "add/2" do
    test "should return a list" do
      assert {:ok, [12.0, 14.0, 16.0, 18.0, 20.0, 22.0, 24.0, 26.0, 28.0]} =
               TalibEx.add(1..9, 11..19)
    end

    test "should return error when the lists are not the same length" do
      assert {:error, :all_lists_should_have_same_length} = TalibEx.add(1..9, 1..19)
    end
  end

  describe "adosc/1" do
    test "should require fast_period" do
      assert {:error, "fast_period is required and should be between 2 and 100,000"} =
               TalibEx.adosc([{:slow_period, 10} | @ohlcv])
    end

    test "should require slow_period" do
      assert {:error, "slow_period is required and should be between 2 and 100,000"} =
               TalibEx.adosc([{:fast_period, 10} | @ohlcv])
    end

    test "should return a list" do
      assert {
               :ok,
               [
                 :nan,
                 :nan,
                 :nan,
                 :nan,
                 :nan,
                 :nan,
                 :nan,
                 :nan,
                 :nan,
                 :nan,
                 :nan,
                 :nan,
                 :nan,
                 :nan,
                 :nan,
                 :nan,
                 :nan,
                 :nan,
                 :nan,
                 :nan,
                 :nan,
                 :nan,
                 :nan,
                 :nan,
                 28_699_342.635970443,
                 23_616_741.17131853,
                 20_502_870.027594402,
                 21_074_165.247332826,
                 23_499_118.00431408,
                 28_299_647.107428387,
                 28_601_455.323854238,
                 32_702_359.3902051,
                 38_471_724.142064676
               ]
             } = TalibEx.adosc([{:fast_period, 10}, {:slow_period, 25} | @ohlcv])
    end
  end

  describe "adx/1" do
    test "should require window" do
      assert {:error, "window is required and should be between 2 and 100,000"} =
               TalibEx.adx(@ohlcv)
    end

    test "should return a list" do
      assert {
               :ok,
               [
                 :nan,
                 :nan,
                 :nan,
                 76.40449438202258,
                 56.277364561902814,
                 59.09106323333209,
                 33.007689426650074,
                 27.213903884922665,
                 29.79020836961979,
                 45.69449221311386,
                 53.646634134860896,
                 73.5666431565025,
                 84.39812689029841,
                 43.328385376236014,
                 49.3851584798321,
                 52.41354503163015,
                 63.5129546081059,
                 50.82065454432387,
                 39.674368031499284,
                 58.63511033429211,
                 43.3109041692263,
                 38.1762580092279,
                 50.949611866368556,
                 57.33628879493889,
                 60.52962725922404,
                 78.79384095521954,
                 88.67694228959732,
                 56.747074049825194,
                 52.63070538746228,
                 60.525953961977706,
                 69.7008729677386,
                 78.41576211831782,
                 86.19329655620886
               ]
             } = TalibEx.adx([{:window, 2} | @ohlcv])
    end
  end

  describe "adxr/1" do
    test "should require window" do
      assert {:error, "window is required and should be between 2 and 100,000"} =
               TalibEx.adxr(@ohlcv)
    end

    test "should return a list" do
      assert {
               :ok,
               [
                 :nan,
                 :nan,
                 :nan,
                 :nan,
                 66.3409294719627,
                 57.684213897617454,
                 46.049376329991084,
                 30.11079665578637,
                 28.502056127271228,
                 37.742350291366826,
                 49.670563173987375,
                 63.6066386456817,
                 78.98238502340045,
                 63.863256133267214,
                 46.35677192803406,
                 50.899351755731125,
                 57.963249819868025,
                 57.166804576214886,
                 45.24751128791158,
                 49.154739182895696,
                 50.9730072517592,
                 40.7435810892271,
                 44.56293493779823,
                 54.14295033065372,
                 58.93295802708147,
                 69.66173410722179,
                 83.73539162240843,
                 72.71200816971125,
                 54.688889718643736,
                 56.578329674719996,
                 65.11341346485816,
                 74.05831754302821,
                 82.30452933726335
               ]
             } = TalibEx.adxr([{:window, 2} | @ohlcv])
    end
  end

  describe "apo/2" do
    test "should require fast_period" do
      assert {:error, "fast_period is required and should be between 2 and 100,000"} =
               TalibEx.apo(1..10, slow_period: 10, moving_average_type: :sma)
    end

    test "should require slow_period" do
      assert {:error, "slow_period is required and should be between 2 and 100,000"} =
               TalibEx.apo(1..10, fast_period: 10, moving_average_type: :sma)
    end

    test "should require moving_average_type" do
      assert {:error,
              "moving_average_type is required and should be one of sma, ema, wma, dema, tema, trima, kama, mama, t3"} =
               TalibEx.apo(1..10, fast_period: 10, slow_period: 25)
    end

    test "should return a list" do
      for mvt <- ~w(sma ema wma dema tema trima kama mama t3)a do
        assert {:ok, [_, _, _, _, _, _, _, _, _, _]} =
                 TalibEx.apo(1..10, fast_period: 10, slow_period: 25, moving_average_type: mvt)
      end
    end
  end

  describe "aroon/1" do
    test "should require high" do
      assert {:error, "expected (high, low) missing high"} = TalibEx.aroon(window: 5, low: 1..10)
    end

    test "should require low" do
      assert {:error, "expected (high, low) missing low"} = TalibEx.aroon(window: 5, high: 1..10)
    end

    test "should require window" do
      assert {:error, "window is required and should be between 2 and 100,000"} =
               TalibEx.aroon(high: 3..12, low: 1..10)
    end

    test "should return down and up as lists" do
      assert {:ok, [:nan, :nan, :nan, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
              [:nan, :nan, :nan, 100.0, 100.0, 100.0, 100.0, 100.0, 100.0, 100.0]} =
               TalibEx.aroon(high: 3..12, low: 1..10, window: 3)
    end
  end

  describe "aroonosc/1" do
    test "should require high" do
      assert {:error, "expected (high, low) missing high"} =
               TalibEx.aroonosc(window: 5, low: 1..10)
    end

    test "should require low" do
      assert {:error, "expected (high, low) missing low"} =
               TalibEx.aroonosc(window: 5, high: 1..10)
    end

    test "should require window" do
      assert {:error, "window is required and should be between 2 and 100,000"} =
               TalibEx.aroonosc(high: 3..12, low: 1..10)
    end

    test "should return down and up as lists" do
      assert {:ok, [:nan, :nan, :nan, 100.0, 100.0, 100.0, 100.0, 100.0, 100.0, 100.0]} =
               TalibEx.aroonosc(high: 3..12, low: 1..10, window: 3)
    end
  end

  describe "asin/1" do
    test "should return a list" do
      assert {:ok, [0.0, 0.2013579207903308, 0.41151684606748806, 0.5235987755982988]} =
               TalibEx.asin([0.0, 0.2, 0.4, 0.5])
    end
  end

  describe "atan/1" do
    test "should return a list" do
      assert {:ok, [1.5607966601082315, 1.560895660206908, 1.5609927193156006]} =
               TalibEx.atan(100..102)
    end
  end

  describe "atr/1" do
    test "should return a list" do
      assert {
               :ok,
               [
                 :nan,
                 :nan,
                 0.6450000000000031,
                 0.9675000000000047,
                 0.9987499999999958,
                 0.7443749999999953,
                 0.6821874999999928,
                 0.5410937499999993,
                 0.5205468749999996,
                 0.7852734374999983,
                 0.7026367187500014,
                 0.921318359375001,
                 0.6506591796874982,
                 0.6203295898437509,
                 0.7851647949218769,
                 0.7325823974609418,
                 0.666291198730468,
                 0.7331455993652326,
                 0.6765727996826114,
                 0.8832863998413074,
                 0.876643199920656,
                 0.7883215999603295,
                 1.1041607999801655,
                 0.9820803999900825,
                 0.8560401999950432,
                 1.238020099997524,
                 1.1640100499987636,
                 1.487005024999383,
                 1.1885025124996917,
                 1.1492512562498456,
                 0.9396256281249248,
                 0.9398128140624613,
                 0.9299064070312315
               ]
             } = TalibEx.atr([{:window, 2} | @ohlcv])
    end
  end

  describe "avgprice/1" do
    test "should return a list" do
      assert {
               :ok,
               [
                 75.9925,
                 76.405,
                 76.845,
                 76.85499999999999,
                 77.57,
                 78.1825,
                 77.8625,
                 78.0425,
                 77.9825,
                 78.24,
                 78.21,
                 78.9,
                 79.5275,
                 79.23500000000001,
                 79.005,
                 78.9125,
                 78.71000000000001,
                 79.065,
                 78.9025,
                 78.555,
                 79.285,
                 79.4,
                 79.07249999999999,
                 79.07000000000001,
                 78.865,
                 77.99,
                 77.04249999999999,
                 78.2475,
                 78.83250000000001,
                 79.25000000000001,
                 79.67500000000001,
                 80.105,
                 80.41499999999999
               ]
             } = TalibEx.avgprice(@ohlcv)
    end
  end

  describe "bbands/2" do
    test "should return a list" do
      assert {:ok, [:nan, 2.1, 3.1, 4.1, 5.1, 6.1, 7.1, 8.1, 9.1, 10.1],
              [:nan, 1.5, 2.5, 3.5, 4.5, 5.5, 6.5, 7.5, 8.5, 9.5],
              [:nan, 1.4, 2.4, 3.4, 4.4, 5.4, 6.4, 7.4, 8.4, 9.4]} =
               TalibEx.bbands(1..10,
                 window: 2,
                 np_dev_down: 0.2,
                 np_dev_up: 1.2,
                 moving_average_type: :sma
               )
    end
  end

  describe "beta/1" do
    test "should return a list" do
      assert {
               :ok,
               [
                 :nan,
                 :nan,
                 0.33333333333333304,
                 0.499999999999998,
                 0.5999999999999904,
                 0.6666666666666555,
                 0.714285714285684,
                 0.7499999999999327,
                 0.7777777777776714,
                 0.7999999999998273
               ]
             } = TalibEx.beta(1..10, 2..11, window: 2)
    end
  end

  describe "bop/1" do
    test "should return a list" do
      assert {
               :ok,
               [
                 -0.21111111111111058,
                 0.6263736263736213,
                 0.2727272727272845,
                 -0.13178294573642377,
                 0.7808219178082207,
                 -0.1750000000000222,
                 0.7115384615384758,
                 -0.12499999999999112,
                 -0.060000000000002274,
                 -0.8285714285714352,
                 0.7142857142857392,
                 0.7192982456140412,
                 -0.18181818181818965,
                 -0.8305084745762578,
                 -0.5157894736842036,
                 -0.25,
                 -0.533333333333327,
                 0.5686274509803987,
                 0.5322580645161346,
                 0.5779816513761408,
                 0.9080459770114967,
                 0.7428571428571544,
                 -0.5845070422535192,
                 0.790697674418613,
                 0.058823529411753644,
                 -0.9382716049382666,
                 -0.38532110091743155,
                 0.8100000000000023,
                 0.9213483146067493,
                 0.9459459459459567,
                 -0.3424657534246557,
                 0.8730158730158748,
                 0.9130434782608716
               ]
             } = TalibEx.bop(@ohlcv)
    end
  end

  describe "sma/2" do
    test "should return a list" do
      assert {:ok, [:nan, 1.5, 2.5, 3.5]} == TalibEx.sma([1.0, 2.0, 3.0, 4.0], window: 2)
    end

    test "should default window to 5" do
      assert {:ok, [:nan, :nan, :nan, :nan, 3.0, 4.0, 5.0, 6.0, 7.0]} ==
               TalibEx.sma([1, 2, 3, 4, 5, 6, 7, 8, 9])
    end

    test "should accept range" do
      assert {:ok, [:nan, :nan, :nan, :nan, 3.0, 4.0, 5.0, 6.0, 7.0]} ==
               TalibEx.sma(1..9, window: 5)
    end
  end

  describe "sqrt/1" do
    test "should return a list" do
      assert {:ok, [1.0, 1.4142135623730951, 1.7320508075688772, 2.0]} ==
               TalibEx.sqrt([1, 2, 3, 4])
    end

    test "should accept range" do
      assert {:ok,
              [
                1.0,
                1.4142135623730951,
                1.7320508075688772,
                2.0,
                2.23606797749979,
                2.449489742783178,
                2.6457513110645907,
                2.8284271247461903,
                3.0
              ]} ==
               TalibEx.sqrt(1..9)
    end
  end
end

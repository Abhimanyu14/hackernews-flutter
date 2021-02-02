import 'package:flutter_test/flutter_test.dart';
import 'package:hackernews/json_parsing.dart';

void main() {
  test('parses topstories.json', () {
    const jsonString =
        '[25998659,25997506,25999437,25999567,25997619,25999954,25998427,25998154,25980060,25999071,25995839,25982716,25999799,25989764,25982774,25998929,25976913,25993486,25999126,25994051,25992782,25996388,25991485,25993512,25993258,25986238,25989085,25995918,25984812,25976856,25995034,25995515,25986378,25990702,25995838,25992735,25995937,25992664,25989698,25988702,25999692,25998441,25986515,25992390,25993826,25988871,25995146,25991077,25992363,25989010,25997693,25984477,25989681,25996567,25978242,25988228,25992913,25998033,25979941,25981811,25997973,25992464,25989532,25990385,25989309,25978078,25990238,25995803,25999197,25992462,25982999,25989762,25997948,25993493,25979774,25968788,25996845,25991458,25991784,25966713,25998813,25976795,25995204,25997644,25996667,25976844,25998148,25990585,25988196,25995254,25987362,25995651,25994709,25977004,25992663,25987949,25976441,25987664,25964226,25989578,25993822,25983421,25989384,25959571,25971355,25994454,25991988,25976266,25976081,25981327,25989336,25993414,25987562,25968431,25992833,25989475,25982302,25994417,25968751,25979584,25986346,25984472,25993671,25990400,25983759,25995760,25977924,25956670,25996942,25993107,25997553,25984829,25973955,25996053,25984941,25988069,25977274,25989454,25995835,25978190,25993381,25989727,25986316,25997609,25968556,25989763,25985084,25963589,25990633,25992126,25992435,25966927,25979673,25982456,25996056,25991201,25998947,25980901,25979436,25990929,25984328,25969886,25968101,25986477,25978053,25976048,25989211,25987314,25979480,25986320,25990739,25984998,25968531,25994787,25979616,25980018,25977122,25981212,25974701,25993154,25975110,25983265,25982159,25974757,25989663,25983895,25978962,25973242,25984970,25994474,25978185,25989726,25956652,25991950,25989196,25968348,25978000,25976439,25978111,25991848,25991154,25980708,25978511,25996447,25977514,25957775,25992641,25976183,25980925,25980957,25969694,25970658,25966542,25978013,25996118,25961420,25989676,25982959,25964865,25968122,25978769,25989934,25979443,25972342,25975428,25969823,25973194,25989524,25997199,25967442,25989437,25967641,25976855,25989195,25982542,25984011,25953668,25995499,25981373,25982614,25990365,25979810,25968564,25972121,25989990,25996141,25953781,25983785,25996922,25996912,25966757,25976599,25950351,25983540,25996028,25978396,25982924,25982860,25994939,25998103,25966988,25996774,25965873,25957307,25973593,25947622,25983630,25996671,25971963,25990453,25994336,25985311,25982576,25976982,25972846,25956502,25972094,25967482,25971037,25955914,25978394,25972764,25958138,25991044,25970690,25958444,25947467,25991587,25971085,25988332,25969976,25959276,25982364,25990623,25970843,25955838,25966706,25995021,25958639,25985920,25960469,25973844,25975457,25977977,25972620,25987671,25957935,25957820,25972411,25966275,25959646,25988875,25990867,25955702,25968945,25956128,25971096,25994220,25992241,25953884,25971395,25956687,25950487,25957748,25956593,25980892,25969235,25991121,25968760,25985859,25986763,25965231,25970502,25961053,25962178,25963237,25997412,25967789,25984125,25954120,25967889,25956152,25987054,25954992,25966187,25992450,25967594,25992301,25968846,25948797,25952042,25955579,25950834,25994650,25960225,25959319,25987945,25985078,25974216,25983609,25974507,25963292,25986038,25967093,25989599,25984604,25979845,25981569,25968679,25964501,25972175,25972097,25989836,25963760,25956329,25993763,25944866,25984123,25974565,25987837,25976275,25985361,25970184,25997578,25993259,25963327,25987697,25993166,25973598,25967382,25972412,25944236,25979431,25957844,25983588,25956551,25956720,25950838,25954830,25970688,25969570,25957688,25988731,25956360,25958395,25968289,25979915,25963556,25982749,25949784,25957923,25992366,25971305,25979064,25992203,25992183,25982525,25951805,25953514,25948840,25971626,25970101,25969614,25972111,25971125,25952311,25971201,25986825,25994100,25947281,25973469,25944922,25988963,25964197,25981460,25981841,25979216,25945397,25963119,25974811,25946103,25969442,25984942,25952969,25990918,25962783,25980737,25980701,25980633,25988376,25981125,25963586,25963580,25954539,25956905,25948391,25949391,25955260,25974214,25984388,25990301,25959694,25950720,25966329,25952659,25955853,25960679,25967462,25967447,25979016,25978985,25981383,25982513,25964832,25982436,25974297,25978675,25962756,25985377,25953890,25979315,25958837,25974641,25971354,25975124,25973236,25989116,25956730,25965855,25979897,25974871,25956644,25947814,25984922,25961443,25948172,25993676,25952811,25967160,25977261]';

    expect(parseTopStories(jsonString).first, 25998659);
  });

  test('parses item.json', () {
    const jsonString =
        '{"by":"dhouston","descendants":71,"id":8863,"kids":[9224,8917,8952,8958,8884,8887,8869,8940,8908,9005,8873,9671,9067,9055,8865,8881,8872,8955,10403,8903,8928,9125,8998,8901,8902,8907,8894,8870,8878,8980,8934,8943,8876],"score":104,"time":1175714200,"title":"My YC app: Dropbox - Throw away your USB drive","type":"story","url":"http://www.getdropbox.com/u/2/screencast.html"}';

    expect(parseArticle(jsonString).by, 'dhouston');
  });
}
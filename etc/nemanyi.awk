function nemanyi(a,      rows, cols) { 
	s2nm(nemanyiStr(), a, rows, cols,",")
}
function nemanyiStr() { return \
	"4, 90         , 95         , 100, " \
	"2, 1.644853627, 1.959963985, 2.575829304, " \
	"3, 2.052292731, 2.343700588, 2.913494392, " \
	"4, 2.291341497, 2.569031777, 3.113250345, " \
	"5, 2.459515764, 2.727774383, 3.254685972, " \
	"6, 2.588520602, 2.849705443, 3.363740372, " \
	"7, 2.692732101, 2.948320061, 3.452212837, " \
	"8, 2.779883609, 3.030878523, 3.526470739, " \
	"9, 2.854606432, 3.101730458, 3.590338796, " \
	"10, 2.919888841, 3.163683754, 3.646291756, " \
	"11, 2.977768252, 3.218653607, 3.6960209, " \
	"12, 3.029694184, 3.268003924, 3.740733168, " \
	"13, 3.076733469, 3.312738593, 3.781318241, " \
	"14, 3.119693334, 3.353617752, 3.818450856, " \
	"15, 3.15919882, 3.391230284, 3.852654475, " \
	"16, 3.195743435, 3.426041379, 3.884343153, " \
	"17, 3.229723403, 3.458424707, 3.913849884, " \
	"18, 3.261461492, 3.488684799, 3.941446363, " \
	"19, 3.291223989, 3.517073009, 3.967357077, " \
	"20, 3.319233062, 3.543799132, 3.991769585, " \
	"21, 3.345675928, 3.569040031, 4.014842153, " \
	"22, 3.370711763, 3.592946138, 4.036709516, " \
	"23, 3.394477001, 3.615646439, 4.057487296, " \
	"24, 3.417089433, 3.637252334, 4.077275432, " \
	"25, 3.438651432, 3.657860676, 4.09616088, " \
	"26, 3.459252512, 3.67755618, 4.11421975, " \
	"27, 3.478971379, 3.696413354, 4.131519032, " \
	"28, 3.497877588, 3.714498068, 4.148117986, " \
	"29, 3.516032902, 3.731868825, 4.16406928, " \
	"30, 3.533492403, 3.748577817, 4.179419927, " \
	"31, 3.550305414, 3.764671792, 4.19421206, " \
	"32, 3.56651627, 3.780192781, 4.208483586, " \
	"33, 3.582164964, 3.795178707, 4.222268721, " \
	"34, 3.59728769, 3.809663903, 4.235598459, " \
	"35, 3.611917306, 3.823679543, 4.248500958, " \
	"36, 3.62608373, 3.837254016, 4.261001873, " \
	"37, 3.639814276, 3.850413251, 4.273124644, " \
	"38, 3.653133949, 3.863180985, 4.284890743, " \
	"39, 3.666065691, 3.875579005, 4.296319882, " \
	"40, 3.678630603, 3.887627352, 4.307430206, " \
	"41, 3.690848135, 3.899344505, 4.31823845, " \
	"42, 3.702736254, 3.910747534, 4.328760079, " \
	"43, 3.714311587, 3.92185224, 4.339009416, " \
	"44, 3.725589551, 3.93267328, 4.348999748, " \
	"45, 3.736584468, 3.943224268, 4.358743427, " \
	"46, 3.747309665, 3.953517876, 4.368251949, " \
	"47, 3.757777561, 3.963565918, 4.377536037, " \
	"48, 3.767999752, 3.97337942, 4.386605704, " \
	"49, 3.777987075, 3.982968696, 4.395470317, " \
	"50, 3.78774968, 3.9923434, 4.404138649, " \
	"51, 3.797297078, 4.001512586, 4.412618928, " \
	"52, 3.806638201, 4.010484755, 4.420918882, " \
	"53, 3.815781442, 4.019267896, 4.429045778, " \
	"54, 3.8247347, 4.027869531, 4.437006457, " \
	"55, 3.833505418, 4.036296746, 4.444807369, " \
	"56, 3.842100614, 4.044556225, 4.452454832, " \
	"57, 3.850526917, 4.052654283, 4.459954052, " \
	"58, 3.858790591, 4.060596887, 4.467310792, " \
	"59, 3.866897565, 4.068389685, 4.474530191, " \
	"60, 3.874853451, 4.076038026, 4.48161712, " \
	"61, 3.882663572, 4.083546982, 4.488576197, " \
	"62, 3.890332978, 4.090921365, 4.495411809, " \
	"63, 3.897866462, 4.098165747, 4.502128121, " \
	"64, 3.905268584, 4.105284473, 4.508729096, " \
	"65, 3.912543679, 4.112281676, 4.515218503, " \
	"66, 3.919695873, 4.119161292, 4.521599932, " \
	"67, 3.9267291, 4.125927072, 4.527876807, " \
	"68, 3.933647109, 4.132582591, 4.534052392, " \
	"69, 3.940453226, 4.139131262, 4.540129801, " \
	"70, 3.947151351, 4.145576343, 4.546112011, " \
	"71, 3.953744512, 4.151920948, 4.552002151, " \
	"72, 3.96023583, 4.158168053, 4.557802235, " \
	"73, 3.966628289, 4.164320508, 4.563515346, " \
	"74, 3.972924747, 4.170381039, 4.569143953, " \
	"75, 3.97912794, 4.176352258, 4.574690429, " \
	"76, 3.985240492, 4.182236671, 4.580157054, " \
	"77, 3.991264918, 4.188036678, 4.585546019, " \
	"78, 3.997203632, 4.193754584, 4.590859429, " \
	"79, 4.003058951, 4.199392601, 4.596099307, " \
	"80, 4.008833102, 4.204952857, 4.601267529, " \
	"81, 4.014528222, 4.210437392, 4.60636616, " \
	"82, 4.02014637, 4.215848173, 4.61139682, " \
	"83, 4.025689523, 4.221187089, 4.616481488, " \
	"84, 4.031159586, 4.22645596, 4.621261234, " \
	"85, 4.036558394, 4.231656537, 4.62609833, " \
	"86, 4.041887711, 4.236790509, 4.630874171, " \
	"87, 4.047149242, 4.241859502, 4.635590302, " \
	"88, 4.052344628, 4.246865085, 4.640246969, " \
	"89, 4.057475451, 4.251808772, 4.64484723, " \
	"90, 4.062543241, 4.256692024, 4.649391771, " \
	"91, 4.067549472, 4.261516249, 4.653881886, " \
	"92, 4.07249557, 4.266282812, 4.658318823, " \
	"93, 4.07738291, 4.270993026, 4.662703789, " \
	"94, 4.082212824, 4.275648166, 4.667037952, " \
	"95, 4.086986596, 4.280249459, 4.671322439, " \
	"96, 4.091705473, 4.284798097, 4.675558344, " \
	"97, 4.096370657, 4.289295231, 4.679746721, " \
	"98, 4.100983314, 4.293741974, 4.683888596, " \
	"99, 4.105544572, 4.298139407, 4.687984957, " \
	"100, 4.110055524, 4.302488574, 4.692036767"
}
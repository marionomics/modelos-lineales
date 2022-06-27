sum
pwcorr
tab call
sum call
tab race
sum race
encode race, gen(racecodes)
label define racetype 1 b_1 2 w_2
drop racecodes
encode race, gen(racecodes) label(racetype)
regres call racecodes
tabulate call racecode
tabulate call, sum (racecode)
tabstat call racecodes, statistic(mean)


tab sex
sum sex
encode sex, gen(sexcodes)
label define sextype 1 f_1 2 m_2
drop sexcodes
encode race, gen(sexcodes) label(sextype)
regres call racecodes sexcodes
tabulate call sexcodes
tabulate call, sum (sexcodes)
tabstat call sexcodes, statistic(mean)

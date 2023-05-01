use https://github.com/scunning1975/mixtape/raw/master/titanic.dta, clear
gen female=(sex==0)
label variable female "Female"
gen male=(sex==1)
label variable male "Male"
gen     s=1 if (female==1 & age==1)
replace s=2 if (female==1 & age==0)
replace s=3 if (female==0 & age==1)
replace s=4 if (female==0 & age==0)
gen     d=1 if class==1
replace d=0 if class!=1
summarize survived if d==1
gen ey1=r(mean)
summarize survived if d==0
gen ey0=r(mean)
gen sdo=ey1-ey0
su sdo

* Subclassification
cap n drop ey1 ey0
su survived if s==1 & d==1
gen ey11=r(mean)
label variable ey11 "Average survival for male child in treatment"
su survived if s==1 & d==0
gen ey10=r(mean)
label variable ey10 "Average survival for male child in control"
gen diff1=ey11-ey10
label variable diff1 "Difference in survival for male children"
su survived if s==2 & d==1
gen ey21=r(mean)
su survived if s==2 & d==0
gen ey20=r(mean)
gen diff2=ey21-ey20
su survived if s==3 & d==1
gen ey31=r(mean)
su survived if s==3 & d==0
gen ey30=r(mean)
gen diff3=ey31-ey30
su survived if s==4 & d==1
gen ey41=r(mean)
su survived if s==4 & d==0
gen ey40=r(mean)
gen diff4=ey41-ey40
count if s==1 & d==0
count if s==2 & d==0
count if s==3 & d==0
count if s==4 & d==0
count if d == 0

gen wt1=281/1876
gen wt2=44/1876
gen wt3=1492/1876
gen wt4=59/1876
gen wate=diff1*wt1 + diff2*wt2 + diff3*wt3 + diff4*wt4
sum wate sdo


use https://github.com/scunning1975/mixtape/raw/master/training_example.dta, clear
histogram age_treat, bin(10) frequency
histogram age_control, bin(10) frequency
su age_treat age_control
su earnings_treat earnings_control

histogram age_treat, bin(10) frequency
histogram age_matched, bin(10) frequency
su age_treat age_control
su earnings_matched earnings_matched

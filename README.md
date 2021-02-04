# Killua01

## Version History
```
Checked functions are now available.
```

### ver. 4.3.1
```
Made DAMFileScan2 function which is for cutting any days DAM data.
```
- [x] DAMFileScan2(yy, mm, dd, hours, mins, days)

### ver. 4.2.1
```
・Changed DAMFileScan function
 to be able to cut DAM data for any date conditions.
・Renamed DAMFileScan to DAMFileScan1.
・Simplified DefineDateX (X is 1, 2, 3 and 4) function
 and named DefinedDate function.
・Changed DefineTime2 to correspond to various days.
```
- [x] kDAMsleep1(yy, mm, dd, hours, mins)
  - [x] DAMFileScan1(yy, mm, dd, hours, mins)
  - [x] DefineDate(yy, mm, dd, j)
  - [x] DefineTime2(time1, days)

### ver. 4.1.1
```
・Made StTest function which is for t-test DAM data
 devided into the first half of day or the second half. 
```
- [x] StTest(LD)
  - [x] SCutfortTest(LD, Outline)
  - [x] SimportMarray(LD, Outline)
  - [x] Sact2sleep(LDMarray)
  - [x] SDAMstat(LDMarray, LDsleep, LD, Outline)
  - [x] SSavestat(LDstat, Outline, LD)
  - [x] SstatExclude1(LDstat, Outline)
  - [x] SstatExclude2(LDstat, Outline)
  - [x] StTestGraphActive(Tstat1, Tstat2, outline, LD)
  - [x] StTestGraphSleep(Tstat1, Tstat2, outline, LD)

### ver. 3.1.1
```
・Made DAMFileScan function which is for cutting 3 days DAM data.
・Changed DAMsleep1 to insert DAMFileScan.
```
- [ ] kDAMsleep1(yy, mm, dd, hours, mins)
  - [ ] DAMFileScan(yy, mm, dd, hours, mins)
    - [x] Month(mm)
    - [ ] DefineDate1(yy, mm, dd)
    - [ ] DefineDate2(yy, mm, dd)
    - [ ] DefineDate3(yy, mm, dd, hours, mins)
    - [ ] DefineDate4(yy, mm, dd, hours, mins)
    - [x] DefineTime1(hours, mins)
    - [ ] DefineTime2(time1)

### ver. 2.2.1
```
・Changed kDAMsleep2 function
 to define the length of y axis (0 - 60 min/hr) and to insert SAVEpng1.
・Changed SAVEpng name to SAVEpng1
 which is for saving the 3-day sleep graph as a png file.
・Changed SAVEpdf name to SAVEpdf1
 which is for saving the 3-day sleep graph as a pdf file.
・kkDAMsleep2 is similar to kDAMsleep2 except for that
 there is no SAVEpng1.
```
- [x] kDAMsleep2(hrs)
  - [x] SAVEpng1(name)
- [x] kkDAMsleep2(hrs)
- [x] SAVEpdf1(name)

### ver. 2.1.1
```
・Made kou function
 which is for making the information on experimental conditions.
```
- [x] kou(light, colour, temp1, temp2, temp3)
  - [x] COWorRAT(light)
    - [x] COW()
    - [x] RAT()
  - [x] arrow(colour, temp1, temp2, temp3)
    - [x] rAr(temp1)
    - [x] bAr(temp1)
    - [x] rbrAr(temp1, temp2, temp3)
    - [x] brbAr(temp1, temp2, temp3)

### ver. 1.2.1
```
・Changed DAMsleep2 functions in flysleep package.
```
- [ ] kDAMsleep2
- [ ] SAVEpng
- [ ] SAVEpdf

### ver. 1.1.1
```
・Made hello function.
```
- [x] hello()

### ver. 1.0.1
```
・Made Killua01 repository.
```

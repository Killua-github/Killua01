# Killua01

## Installation

Install Killua01 package
```
devtools:install_github("Killua-github/Killua01")
```

Install flysleep package
```
devtools:install_github("ueno-tr/flysleep")
```

Install summary.xls and yuna.xls files
> https://drive.google.com/drive/folders/1zEObP64_WZdeTE_4SLK25vzhQtBqKnBG?usp=sharing

## Usage

The usage detail of flysleep package and functions.
> https://github.com/ueno-tr/flysleep

Print "Hello, world!". 
```
hello()
```

Analyze Original DAM data for 3 days by DAMFileScan and flysleep::DAMsleep1.
```
kDAMsleep1(yy, mm, dd, hours, mins)
```
> Arguments  
> - yy; year which is the target period start point in two digits  
> - mm; month which is the target period start point in two digits  
> - dd; day which is the target period start point in two digits  
> - hours; hour which is the target period start point in two digits  
> - mins; minute which is the target period start point in two digits  

```
Cut out target DAM data from original DAM data.

  Arguments
　　yy; year which is the target period start point in two digits
　　mm; month which is the target period start point in two digits
　　dd; day which is the target period start point in two digits
　　hours; hour which is the target period start point in two digits
　　mins; minute which is the target period start point in two digits
　　days; length of the targer period in two digits
```
> DAMFileScan(yy, mm, dd, hours, mins, days)

```
DAM analyze and make a sleep analysis graph which is fixed y axis value use after flysleep::DAMsleep1.

  Arguments
　　hrs; the return value from DAMsleep1
```
> kDAMsleep2(hrs)

```
DAM analyze and make a sleep analysis graph which is fixed y axis value use after flysleep::DAMsleep1 without saving the graph.

  Arguments
　　hrs; the return value from DAMsleep1
```
> kkDAMsleep2(hrs)

```
Save a sleep analysis graph as a png file.

  Arguments
　　name; file name written like "character.png" and character is changeable.
```
> SAVEpng1(name)

```
Save a sleep analysis graph as a pdf file.

  Arguments
　　name; file name written like "character.png" and character is changeable.
```
> SAVEpdf1(name)

```
Make a light and tempareture information figure.

  Arguments
　　light; "LD" to make a LD light information figure
　　       "DD" to make a DD light information figure
　　colour; "B" to only make a blue arrow for a tempareture information figure
　　        "R" to only make a red arrow for a tempareture information figure
　　        "BRB" to make a blue-red-blue arrow for a tempareture information figure
　　        "RBR" to make a red-blue-red arrow for a tempareture information figure
　　　if "B" or "R", temp1; tempareture written in number
　　　               temp2; not use
　　　               temp3; not use
　　　if "BRB" or "RBR", temp1; first tempareture written in number
　　　                   temp2; second tempareture written in number
　　　                   temp3; third tempareture written in number
```
> kou(light, colour, temp1, temp2, temp3)

```
3 days DAM data analyze by tTest.
```
> KEN()

```
3 days DAM data analyze by tTest divide into the first hale of a day and the second half of a day.

  Arguments
　　LD; "L" for selecting the first half of a day
　　    "D" for selecting the second half of a day
```
> StTest(LD)

```
Save a tTest analysis graph as a png file.

  Arguments
　　name; file name written like "character.png" and character is changeable.
```
> SAVEpng2(name)

```
Save a tTest analysis graph as a png file.

  Arguments
　　name; file name written like "character.png" and character is changeable.
```
> SAVEpdf2(name)

```
Make doubleplotting graph using individual DAM data.
```
> Doubleplot1()

```
Make doubleplotting graph using average DAM data.

  Arguments
　　Marray; the return value from Doubleplot1
```
> Doubleplot2(Marray)

## Version History
```
Checked functions are now available.
```

### ver. 6.2.1
```
・Update Usage
```

### ver. 6.1.1
```
・Made KEN functions which is for tTest 3 days DAM data.
```
- [x] KEN()
  - [x] DORA(pon, acmean1, acmean2, slmean1, slmean2)
  - [x] HATU(dora, acmean1, acmean2)
  - [x] TYUN(dora, slmean1, slmean2)

### ver. 5.4.1
```
・Created Usage in README
```

### ver. 5.3.1
```
・Changed the Details of All Function.
```

### ver. 5.2.1
```
・Made SAVEpng2 and SAVEpdf2 functions for StTest.
```
- [x] SAVEpng2(name)
- [x] SAVEpdf2(nmae)

### ver. 5.1.1
```
・Changed the details of importMarray2, doubleplotall, DAMstat, and doubleplotsummary for doubpleplotting.
・Made Doubleplotting1 and Doubleplotting2 functions which is for doubleplotting.
```
- [x] Doubleplot1()
  - [ ] DimportMarray2()
  - [x] Ddoubleplotall(Marray)
  - [x] DDAMstat(Marray, sleep)
- [x] Doubleplot2(Marray)
  - [x] Ddoubleplotsummary(Marray, outline, Outline)

### ver. 4.5.1
```
・Created Version History in README.
```

### ver. 4.4.1
```
・Simplified DAMFileScan1 and DAMFileScan2 to one function and named DAMFileScan.
```
- [x] DAMFileScan(yy, mm, dd, hours, mins, days)

### ver. 4.3.1
```
・Made DAMFileScan2 function which is for cutting any days DAM data.
```
- [ ] DAMFileScan2(yy, mm, dd, hours, mins, days)

### ver. 4.2.1
```
・Changed DAMFileScan function to be able to cut DAM data for any date conditions.
・Renamed DAMFileScan to DAMFileScan1.
・Simplified DefineDateX (X is 1, 2, 3 and 4) function and named DefinedDate function.
・Changed DefineTime2 to correspond to various days.
```
- [x] kDAMsleep1(yy, mm, dd, hours, mins)
  - [ ] DAMFileScan1(yy, mm, dd, hours, mins)
    - [x] DefineDate(yy, mm, dd, j)
    - [x] DefineTime2(time1, days)

### ver. 4.1.1
```
・Made StTest function which is for t-test DAM data devided into the first half of day or the second half. 
```
- [x] StTest(LD)
  - [x] SCutfortTest(LD, Outline)
  - [x] SimportMarray(LD, Outline)
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
・Changed kDAMsleep2 function to define the length of y axis (0 - 60 min/hr) and to insert SAVEpng1.
・Changed SAVEpng name to SAVEpng1 which is for saving the 3-day sleep graph as a png file.
・Changed SAVEpdf name to SAVEpdf1 which is for saving the 3-day sleep graph as a pdf file.
・kkDAMsleep2 is similar to kDAMsleep2 except for that there is no SAVEpng1.
```
- [x] kDAMsleep2(hrs)
  - [x] SAVEpng1(name)
- [x] kkDAMsleep2(hrs)
- [x] SAVEpdf1(name)

### ver. 2.1.1
```
・Made kou function which is for making the information on experimental conditions.
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

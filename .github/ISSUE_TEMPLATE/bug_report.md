---
name: Bug report
about: If something does not work right
title: ''
labels: ''
assignees: ''

---

- [ ] I have read the instructions on [how to create a useful bug report](https://github.com/SebiderSushi/sdcard-w_inject/#report-issues--incompatibilities)

**Environment:**
 - Device: 
 - ROM name: 
 - ROM based on android version: 
 - Magisk version: 
 - Module version & variant (normal, permissive or setenforce0): 

**Expected behavior**
Describe what you did and what you exepected to happen.

**Observed behavior**
Describe what happened instead.

**Additional Information**
Add any other context about the problem here.


**Logs**
Boot with the module installed, open a rooted terminal, then fill out the following:
<details>
  <summary><b>Contents of `postfsdata.log` in the module directory under `/data/adb/modules/`</b></summary>
```
[paste logs here]
```
</details>
<details>
  <summary><b>Output of `ls -Zal /system/bin/`</b></summary>
```
[paste logs here]
```
</details>
<details>
  <summary><b>Output of `logcat -d`</b></summary>
```
[paste logs here, if you have privacy concerns, `logcat -d | grep sdcard` and `logact -d | grep vold` might be enough]
```
</details>
<details>
  <summary><b>Output of `dmesg`</b></summary>
```
[paste logs here, if you have privacy concerns, `dmesg | grep denied` might be enough]
```
</details>

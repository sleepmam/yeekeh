# yeekeh
working on text processing

- For Yike - 
  - `102_table.xlsx` should be how the output file looks like (an excel table);

    - for excel file, the variable list is `Sub, block, Btype, trial. img1, img2, Resp, RT`

  - `102_long.txt` is the original file;

    - the variables needed are 

      ```python
      Subject:
      BlockNum: 
      Procedure: 
      TrialNUM: #the first trial starts from none; therefore, none in TrialNUM means trial = 1; all other number in TrialNUM needs to be "+1"ed (1=2, 2=3, etc. )
      img1:
      img2: 
      ChoiceB.RESP:
      ChoiceB.RT:
      ```

  - `102_short.txt` is just a short version of 102_long

  - `xm_process.ipynb` is the codebook being developped by XM. 
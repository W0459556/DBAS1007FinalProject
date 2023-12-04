
"use strict";
const fs = require('fs');
const readlineSync = require('readline-sync');

/*
Breanna Young
December 4
Generate an insert into statement from a CSV
*/


function main(){

  // define input, output file; charset

  let inputFile = "CSV.csv";
  let outputFile = "insertInto.txt";
  const charSet = "utf-8";

  fs.writeFileSync(outputFile, "");

  let rawData = fs.readFileSync(inputFile,charSet); // read csv

  
  let rows = rawData.split("\n"); // split it into an array or rows 

  // console.log(rows); for testing

  let insertArray = []; // creates array to make 2d array of airlineinfo

  for(var i = 0; i < rows.length; i++){ // goes over each line except the labels in the array from csv
    let info = []; // creates array to push to airlineInfo as 2d array.
    info = rows[i].split(","); // separates the info by commas
    insertArray.push(info); // pushes it to 2d array 
  }

  var rowsArray = [];

  for(var i = 1; i<insertArray.length-1; i++){
    var row = "";
    for(var j = 0; j<insertArray[i].length; j++){
        if(i==1){
            row += (`${insertArray[i][j]},`);
        }
        else if(insertArray[i][j].toLowerCase()=="null"){
            if(j==(insertArray[i].length-1)){
                row += "NULL";
            }
            else{
                row += "NULL,";
            }
        }
        else{
            if(j==(insertArray[i].length-1)){
                row += (`'${insertArray[i][j]}'`);
            }
            else{
                row += (`'${insertArray[i][j]}',`);
            }
        }
    }
    rowsArray.push(`(${row})`);
  }
  
  var outputContent = (`INSERT INTO ${insertArray[0][0]}${rowsArray[0]}\nVALUES`);
  for(i=1; i<rowsArray.length; i++){
    if(i==(rowsArray.length-1)){
        outputContent += (`\n${rowsArray[i]};`);
    }
    else{
        outputContent += (`\n${rowsArray[i]},`);
    }
  }
  
  fs.writeFileSync(outputFile, outputContent);
}
  
if (require.main ===module){
    main();
}
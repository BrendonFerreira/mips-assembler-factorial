function fat(num){
  if( num <= 0 ){
    return 1
  }
  else {
    return num * fat(num-1)
  }
}


console.log("Fatorial de",process.env.NUM, "é",fat(process.env.NUM))

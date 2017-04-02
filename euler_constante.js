function factorial(number){
  if( number == 0 ){
    return 1;
  }
  if( number < 0 ){
    return -1;
  }
  return factorial(number - 1) * number;
}

function euler(iterations){
  if( iterations == 0){
    return 1;
  }
  return (1 / factorial(iterations)) + euler( iterations - 1 );
}


console.log(euler(2))

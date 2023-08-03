int ageCalculate(DateTime today, DateTime bd) {
  final year = today.year - bd.year;
  final mth = today.month - bd.month;
  final days = today.day - bd.day;

  if(mth < 0){
    if (year == 0){
      return 0;
    }
    return year-1;
  }
  if (mth == 0){
    if (days < 0){
      if (year == 0){
        return 0;
      }
      return year-1;
    }
    else{
      return year;
    }
  }
  if (mth > 0){
    return year;
  }
  return year;

}
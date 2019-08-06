// average = sum / totalNumber

int[] numbers = {10, 3, 6, 7, 2, 100, 50, 12};

float sum = 0;
int count = 0;
for (int i=0; i<numbers.length; i++) {
  if (numbers[i] > 200 && numbers[i] < 1000) {
    sum += numbers[i];
    count++;
  }
}
println(sum);

float avg = 0;
if (count > 0) {
  avg = sum / count;
}
println(avg); 

// NaN
// Not a Number

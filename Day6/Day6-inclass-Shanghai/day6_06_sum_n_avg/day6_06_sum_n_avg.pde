int[] numbers = {0, 5, 6, 7, 2, 10, 100, 250};

float sum = 0;
int count = 0;
for (int i=0; i<numbers.length; i++) {
  if (numbers[i] > 3 && numbers[i] < 10) {
    sum += numbers[i];
    count++;
  }
}
println(sum);

// average = sum / totalNumber
float avg = 0;
if (count > 0) {
  avg = sum / count;
}
println(avg);

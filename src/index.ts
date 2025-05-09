const formatString = (input: string, toUpper?: boolean): string => {
  if (toUpper === false) {
    return input.toLowerCase();
  }

  return input.toUpperCase();
};

const filterByRating = (
  items: { title: string; rating: number }[]
): { title: string; rating: number }[] => {
  const filteredArray = items.filter(
    (item: { title: string; rating: number }) => item?.rating >= 4
  );
  return filteredArray;
};

const concatenateArrays = <T>(...arrays: T[][]): T[] => {
  const arr = [] as T[];
  const concatedArr = arr.concat(...arrays);
  return concatedArr;
};

class Vehicle {
  constructor(private make: string, private year: number) {}

  getInfo() {
    return `Make: ${this.make}, Year: ${this.year}`;
  }
}

class Car extends Vehicle {
  constructor(make: string, year: number, private model: string) {
    super(make, year);
  }

  getModel() {
    return `Model: ${this.model}`;
  }
}

const processValue = (value: string | number): number => {
  if (typeof value === "string") {
    return value.length;
  }

  return value * 2;
};

interface Product {
  name: string;
  price: number;
}

const getMostExpensiveProduct = (products: Product[]): Product | null => {
  if (products.length === 0) {
    return null;
  }

  const highestValue = products.toSorted(
    (a: Product, b: Product) => b?.price - a.price
  );
  return highestValue[0];
};

enum Day {
  Monday,
  Tuesday,
  Wednesday,
  Thursday,
  Friday,
  Saturday,
  Sunday,
}

const getDayType = (day: Day): string => {
  if (day === Day.Saturday || day === Day.Sunday) {
    return "Weekend";
  }

  return "Weekday";
};

const squareAsync = async (n: number): Promise<number> => {
  return new Promise((resolve, reject) => {
    if (n >= 0) {
      setTimeout(() => {
        return resolve(n ** 2);
      }, 1000);
    } else {
      return reject("Error: Negative number not allowed");
    }
  });
};

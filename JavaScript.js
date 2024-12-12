// Quection 1.1
Date.prototype.daysTo = function (date) {
  if (date instanceof Date) {
    const start = this.getTime();
    const end = date.getTime();

    const difference = end - start;
    const msPerDay = 24 * 60 * 60 * 1000;

    return Math.floor(difference / msPerDay);
  }
  throw new Error("Invalid Date");
};

const d1 = new Date("2024-01-01");
const d2 = new Date("2024-01-31");

console.log(d1.daysTo(d2));

// Quection 1.2
function calSales(sales) {
  const salesAndTotal = sales.map((sale) => ({
    ...sale,
    Total: sale.amount * sale.quantity,
  }));

  return salesAndTotal.sort((a, b) => a.Total - b.Total);
}

const inputArray = [
  { amount: 10, quantity: 10 },
  { amount: 10, quantity: 2 },
  { amount: 10, quantity: 4 },
  { amount: 10, quantity: 5 },
];

const result = calSales(inputArray);
console.log(result);

const src = {
  prop11: {
    prop21: 21,
    prop22: {
      prop31: 31,
      prop32: 32,
    },
  },
  prop12: 12,
};

const proto = {
  prop11: {
    prop22: null,
  },
};

// Quection 1.3
function projectObject(sourceObj, prtoObj) {
  const projectedObject = {};

  for (const key in prtoObj) {
    if (key in sourceObj) {
      const sourceValue = sourceObj[key];
      const protoValue = prtoObj[key];

      if (typeof protoValue == "object" && protoValue !== null) {
        const nestedProjection = projectObject(sourceValue, protoValue);
        if (nestedProjection !== undefined) {
          projectedObject[key] = nestedProjection;
        }
      } else {
        projectedObject[key] = sourceValue;
      }
    }
  }
  return projectedObject;
}

console.log(projectObject(src, proto));

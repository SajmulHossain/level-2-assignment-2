const formatString = (input: string, toUpper?: boolean): string => {
    if(toUpper === false) {
        return input.toLowerCase();
    }

    return input.toUpperCase();
}


const filterByRating = (
  items: { title: string; rating: number }[]
): { title: string; rating: number }[] => {
    const filteredArray = items.filter((item: {title: string, rating: number}) => item?.rating >= 4);
    return filteredArray;
}

const concatenateArrays = <T>(...arrays: T[][]): T[] => {
    const arr = [] as T[];
    const concatedArr = arr.concat(...arrays);
    return concatedArr;
}
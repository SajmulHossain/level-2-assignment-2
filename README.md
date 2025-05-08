
# Interfaces vs Types and the `keyof` keyword

When I started using TypeScript, two things confused me right away — the difference between `interface` and `type`, and what the heck `keyof` was actually doing. If you're in the same boat, this post should help clear that up.

---

## Interfaces vs Types: What's the Difference?

At first, I thought `interface` and `type` were basically the same thing. I mean, look at this:

```ts
interface User {
  name: string;
  age: number;
}

type Product = {
  title: string;
  price: number;
};
```

Both describe an object shape. So... what's the big deal?

Well, here's what I learned:

- **Interfaces** are great for extending and building off of. You can use them with `extends`, and even declare the same interface multiple times — TypeScript will merge them.
- **Types** are more flexible. They let you create unions, intersections, tuples, and alias primitive types.

For example:

```ts
type ID = string | number;

interface Dog {
  name: string;
}

interface Dog {
  breed: string;
}

// This works — Dog now has both `name` and `breed`
const myDog: Dog = {
  name: "Rex",
  breed: "German Shepherd"
};
```

You can't do that kind of merging with `type`. But `type` lets you do things like:

```ts
type Status = "loading" | "success" | "error";
type Point = [number, number];
```

So which should you use? Honestly, it depends. I usually go with `interface` when I'm describing an object shape, and `type` when I need unions or something more complex. But there's no strict rule, just use what makes sense.

---

## The `keyof` Keyword

I used to skip over `keyof` whenever I saw it. It looked complicated and unnecessary. Turns out, it's actually super handy.

Let's say you have a type like this:

```ts
type User = {
  id: number;
  name: string;
  isAdmin: boolean;
};
```

Now if you write:

```ts
type UserKeys = keyof User;
```

`UserKeys` becomes a union of the keys: `"id" | "name" | "isAdmin"`

That alone is cool, but the real magic happens when you combine it with generics. Here's a function that lets you safely access a value from an object based on a key:

```ts
function getValue<T, K extends keyof T>(obj: T, key: K): T[K] {
  return obj[key];
}

const user = {
  id: 1,
  name: "Alice",
  isAdmin: false
};

const name = getValue(user, "name"); // returns "Alice"
```

TypeScript knows that if you ask for `"name"`, it'll return a `string`. No casting, no guessing.It just works. This is insanely useful when building forms, filters, or dynamic UIs.

---

## Final Thoughts

TypeScript has a bit of a learning curve, but it's totally worth it. Understanding when to use `type` vs `interface`, and knowing how to take advantage of `keyof`, will make your code safer, smarter, and easier to maintain.

# Object Relations Code Challenge - Product Reviews

For this assignment, we'll be working with an e-commerce domain like Amazon. We'll be focusing on the product reviews.

We have three models: `User`, `Review`, and `Product`.

For our purposes, a `Product` has many `User`s, a `User` has many `Products`s, and a `Review` belongs to a `User` and to a `Product`.

`Product` - `User` is a many to many relationship.

**Note**: You should draw your domain on paper or on a whiteboard _before you start coding_. Remember to identify a single source of truth for your data.

## Topics

- Active Record Migrations
- Object Relationships
- Active Record Queryng

## Instructions

To get started, run `bundle install` while inside of this directory.

Build out all of the methods listed in the deliverables. The methods are listed in a suggested order, but you can feel free to tackle the ones you think are easiest. Be careful: some of the later methods rely on earlier ones.

**Remember!** This code challenge does not have tests. You cannot run `rspec` and you cannot run `learn`. You'll need to create your own sample instances so that you can try out your code on your own. Make sure your associations and methods work in the console before submitting.

We've provided you with a tool that you can use to test your code. To use it, run `rake console` from the command line. This will start a `pry` session with your classes defined. You can test out the methods that you write here. You are also encouraged to use the `seeds.rb` file to create sample data to test your models and associations.

Writing error-free code is more important than completing all of the deliverables listed - prioritize writing methods that work over writing more methods that don't work. You should test your code in the console as you write.

Similarly, messy code that works is better than clean code that doesn't. First, prioritize getting things working. Then, if there is time at the end, refactor your code to adhere to best practices. 

**Before you submit!** Save and run your code to verify that it works as you expect. If you have any methods that are not working yet, feel free to leave comments describing your progress.

## What You Already Have

The starter code has migrations and models for the initial `User` and `Product` models, and seed data for some `User`s and `Product`s. The schema currently looks like this: 

#### Users Table
| Column      | Type      |
| ------------| ----------|
| name        | String    |

#### Products Table
| Column                | Type      |
| -----------           | --------- |
| name                  | String    |
| price                 | Integer   |

You will need to create the migration for the `reviews` table using the attributes specified in the deliverables below.

## Deliverables

Write the following methods in the classes in the files provided. Feel free to build out any helper methods if needed.

Deliverables use the notation `#` for instance methods, and `.` for class methods.

Remember: Active Record give your classes access to a lot of methods already! Keep in mind what methods Active Record gives you access to on each of your classes when you're approaching the deliverables below.

### Migrations

Before working on the rest of the deliverables, you will need to create a migration for the `reviews` table. 

- A `Review` belongs to a `Product`, and a `Review` also belongs to a `User`. In your migration, create any columns your `reviews` table will need to establish these relationships.
- The `reviews` table should also have:
  - A `star_rating` column that stores an integer.
  - A `comment` column that stores a string.

After creating your migration, create your `Review` class, and use the `seeds.rb` file to create `Review` instances so you can test your code.

**Once you've set up your `Review` class**, work on building out the following deliverables.

### Object Relationship Methods

Use Active Record association macros and Active Record query methods where appropriate (i.e. `has_many`, `has_many through`, and `belongs_to`).

#### Review

- `Review#user`
  - should return the `User` instance for this Review
- `Review#product`
  - should return the `Product` instance for this Review

#### Product

- `Product#reviews`
  - returns a collection of all the Reviews for the Product
- `Product#users`
  - returns a collection of all the Users who reviewed the Product

#### User

- `User#reviews`
  - should return a collection of all the Reviews that the User has given
- `User#products`
  - should return a collection of all the Products that the User has reviewd

### Aggregate and Association Methods

#### Review

- `Review#print_review`
  - should `puts` to the terminal a string formatted as follows: `Review for {insert product name} by {insert user name}: {insert review star_rating}. {insert review comment}`

#### Product

- `Product#leave_review(user, star_rating, comment)`
  - takes a `User` (an instance of the `User` class), a `star_rating` (integer), and a `comment` (string) as arguments, and creates a new `Review` in the database associated with this Product and the User
- `Product#print_all_reviews`
  - should `puts` to the terminal a string representing each review for this product
  - each review should be formatted as follows: `Review for {insert product name} by {insert user name}: {insert review star_rating}. {insert review comment}`
- `Product#average_rating`
  - returns a `float` representing the average star rating for all reviews for this product

#### User

- `User#favorite_product`
  - returns the product instance that has the highest star rating from this user
- `User#remove_reviews(product)`
  - takes a `Product` (an instance of the `Product` class) and removes *all* of this user's reviews for that product
  - you will have to delete any rows from the `reviews` table associated with this user and the product
- `User.most_reviews`
  - returns *one* User instance for the User who has given the most reviews

## Rubric

### Active Record Associations

1. No associations, no foreign key on the table.
2. Associations attempted in the model but are incorrect; foreign key is on a table but in the wrong spot.
3. Relationships properly created. Associations lead to the correct behavior but may have used the wrong macro or manually written out the methods the macro builds for us.
4. Relationships properly created, save minor mistakes in advanced deliverables. May implement advanced query methods with iterators instead of using built-in methods.
5. Relationships properly created. Advanced query methods use appropriate built-in methods.

### Build classes using OO Ruby Syntax

1. Class code has a syntax or runtime error. Code does not run at all, or exits with an error, or most Object-oriented deliverables are not implemented.
2. No syntax errors. Some deliverables function correctly. Mixes up syntax for class and instance methods, refers to variables in the wrong scope, or uses `self` incorrectly, leading to logical errors. Method and variable names do not correspond to their respective behavior or data types. Methods might be duplicated, or code includes unused methods without a clear purpose.
3. Correct class syntax for the deliverables submitted. May be incomplete or missing deliverables. Most code generally expresses intent: method and variable names match their behaviors and data types. Methods are not duplicated. Code does not have unused or methods without a clear purpose.
4. Correct class syntax for all of the submitted code. Code express intent: method and variable names indicate their behavior and data types. Some deliverables might not be complete. No methods are duplicated.
5. Correct class syntax for all deliverables, all deliverables complete. Code expresses intent: method and variable names indicate their behavior and data types, with the correct pluralization. No methods are duplicated. All methods have a clear purpose. Shared functionality is factored out into helper methods. Appropriate use of attr\_\* macros.

### Model relationships using Ruby

1. Submitted code does not relate models to each other through methods or data.
2. Models relate to each other, but incompletely. Relationship methods are missing or have logic errors, store data on the wrong model, or are missing a single source of truth.
3. Models relate to each other as specified in the instructions. Data is stored on the correct models, relationship methods are defined on the right models, and the logic correctly implements the relationships. Aggregate methods using the relationships may be incomplete or have errors.
4. Models relate to each other as specified in the instructions. Aggregate methods work, but might not use helper methods effectively.
5. Models relate to each other as specified in the instructions. Aggregate methods use helper methods effectively.

### Solve problems with collections of data

1. Does not attempt to solve collections problems, or has syntax errors in collection code.
2. Collections methods have runtime or logic errors. Collections methods may use the wrong iterators, have incorrect logic, or many of the collections methods are unimplemented.
3. Some collections methods work correctly, though several might be unimplemented. Code may not use the appropriate built in method for each problem, or duplicate logic instead of using helper methods.
4. All collections methods are implemented and function correctly. Most use appropriate higher-level built-in methods. Methods may duplicate logic instead of using helper methods.
5. All collections methods implemented and function correctly, using appropriate higher-level built-in methods. Shared logic is factored out to helper methods.
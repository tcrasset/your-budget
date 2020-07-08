# Brainstorm

## Budgets accors many months

One solution to having a budget for each month is to save the generic
category names and subcategory names in a data base, and have another
table for budgeted values with values

- `id` #PRIMARY KEY
- `subcategory.id`
- `month`
- `year`
- `budgeted_value`
- ???`available_value` ???

I still don't know if we'll need the `available_value` field, maybe this could be computed directly from the starting amount in the accounts and then computing the available value by
looking at all the previously budgeted values and the transaction that have been made
on that category since then.

This would help us have different values for different months, without storing every category
of every month separately.

## Goals

Further up the road, when we would like to introduce goals and such,
we could the have goals that tied to a subcategory with values such as

- `id` #PRIMARY KEY
- `subcategory.id`
- ??? `start_month` ???
- ??? `start_year` ???
- `end_month`
- `end_year`
- `goal_name`
- `goal_target_value`

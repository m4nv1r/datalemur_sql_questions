SELECT
  concat(t1.topping_name, ',', t2.topping_name, ',', t3.topping_name) as pizza,
  t1.ingredient_cost + t2.ingredient_cost + t3.ingredient_cost as ingredient_cost
FROM pizza_toppings t1 
  cross join pizza_toppings t2 
  cross join pizza_toppings t3
where t1.topping_name < t2.topping_name 
  and t2.topping_name < t3.topping_name
  and t1.topping_name != t2.topping_name
  and t1.topping_name != t3.topping_name
  and t2.topping_name != t3.topping_name
order by 
  (t1.ingredient_cost + t2.ingredient_cost + t3.ingredient_cost) desc,
  concat(t1.topping_name, ',', t2.topping_name, ',', t3.topping_name)
;
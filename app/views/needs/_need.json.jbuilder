json.need do
  json.id :id
  json.ingredientName need.ingredient.name
  json.amount :amount
  json.amountType :amount_type
end
# product-variants-management

### Database Structure

1. Create Database running `structure.sql` script

![Tux, the Linux mascot](/assets/er-model.png)

2. Populate table with data example running `data-example.sql` script

### API Design

`getProducts`

>Description

Return list of all products of the database

>Output
```
    {
        "products" : [
            {
                "id": 1,
                "name": "Dell Inspiron 15"
            },
            {
                "id": 2,
                "name": "HP 15-fd1004nl"
            }
        ]
    }
```



`getProductOptions`

>Description

Return all the possible options associated to the product variant 
If default is 1 then return all the options of the default product variant
Otherwise if default is 0 then variantCode is mandatory and return all the options of the product variant specified

>Parameters

	productCode 	int
	default		 	int 
	variantCode		int (optional)

>Output
```
{
	"id": 1,
	"name": "Dell Inspiron 15",
	"variant": {
		"id": 1,
		"sku": "DELLV1",
		"default": 1,
		"options": [
			{
				"id": 1,
				"name": "Processore",
				"values": [
					{
						"id": 1,
						"name": "Intel Core i3",
						"price": 0.00
					},
					{
						"id": 2,
						"name": "Intel Core i5",
						"price": 0.00
					},
					{
						"id": 3,
						"name": "Intel Core i7",
						"price": 0.00
					},
				],
			},
			{
				"id": 2,
				"name": "S.O.",
				"values": [
					{
						"id": 4,
						"name": "Win 10",
						"price": 0.00
					},
					{
						"id": 5,
						"name": "Win 11",
						"price": 0.00
					}
				],
			},
			{...},
		]
	}
}		
```
		
`checkOptionCompatibility`

>Description

After select new option value this function check if it belongs to the same variant of the product selected.
If it belongs to return true, otherwise return false

>Parameters

	productCode		int
	variantCode		int
	optionCode		int	
	optionValue		int
	
>Output

	isCompatible	boolean



`proposeProductOptionChange`

>Description

Propose to the user the possible variant based on the option value selected to avoid mistake on compatibility constraints 

**Parameter**

	productCode		int
	variantCode		int
	optionCode		int
	optionValue		int
	
>Output
```
{
	"id": 1,
	"name": "Dell Inspiron 15",
	"old-sku": "DELLV1",
	"new-sku": "DELLV2",
	"change": {
		"options": [
			{
				"id": 1,
				"name": "Processore",
				"old-value": {
					"id": 1,
					"name": "Intel Core i3",
					"price": 0.00
				},
				"new-value": {
					"id": 1,
					"name": "Intel Core i5",
					"price": 0.00
				},
			},
			{
				"id": 2,
				"name": "S.O.",
				"old-value": {
					"id": 1,
					"name": "Win 10",
					"price": 0.00
				},
				"new-value": {
					"id": 1,
					"name": "Win 11",
					"price": 0.00
				},
			},
			{...},
		]
	}
}
```

`setNewProductOptionValue`

>Description

Set new options values that belong to the variant of the option value selected

>Parameters

	productCode		int
	variantCode		int
	options			array
    

### Frontend Model
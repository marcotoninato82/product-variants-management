# product-variants-management

### Database Structure

1. Create Database running `structure.sql` script

![ER Model](/assets/er-model.png)

2. Populate table with data example running `data-example.sql` script

### API Design

`getProducts`

>Description

Return list of all products of the database with relative variants

>Output
```
{
	"products" : [
		{
			"id": 1,
			"name": "Dell Inspiron 15",
			"variants" : [
				{ 
					"id": 1,
					"sku": "DELLV1"
				},
				{ 
					"id": 2,
					"sku": "DELLV2"
				}
			]
		},
		{
			"id": 2,
			"name": "HP 15-fd1004nl",
			"variants" : [
				{ 
					"id": 1,
					"sku": "HPVAR1"
				},
				{ 
					"id": 2,
					"sku": "HPVAR2"
				}
			]
		}
	]
}
```



`getProductOptions`

>Description

Return all the possible options associated to the product independently of the variant.

Select the values ​​of each option by taking them from the lowest price of each option associated with the first variant of the product.

>Parameters

	productCode 	int

>Output
```
{
	"id": 1,
	"name": "Dell Inspiron 15",
	"variant": {
		"id": 1,
		"sku": "DELLV1",
		"options": [
			{
				"id": 1,
				"name": "Processore",
				"values": [
					{
						"id": 1,
						"name": "Intel Core i3",
						"price": 54.99,
						"select": true
					},
					{
						"id": 2,
						"name": "Intel Core i5",
						"price": 69.00,
						"select": false
					},
					{
						"id": 3,
						"name": "Intel Core i7",
						"price": 133.99,
						"select": false
					}
				]
			},
			{
				"id": 2,
				"name": "S.O.",
				"values": [
					{
						"id": 4,
						"name": "Win 10",
						"price": 26.90,
						"select": true
					},
					{
						"id": 5,
						"name": "Win 11",
						"price": 35.99,
						"select": false
					}
				]
			},
			{
				"id": 2,
				"name": "Scheda Grafica",
				"values": [
					{
						"id": 6,
						"name": "NVIDIA GeForce RTX",
						"price": 659.90,
						"select": true
					},
					{
						"id": 7,
						"name": "Intel Iris Xe",
						"price": 309.99,
						"select": false
					}
				]
			},
			{...}
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
	currentOptionValue		int
	newOptionValue		int
	
>Output

	isCompatible	boolean



`proposeProductOptionChange`

>Description

Propose to the user the possible variations based on the new option value selected to avoid mistake on compatibility constraints. 

For example if the form is populate with the options of DELLV1 sku and for optionCode (3 - Scheda Grafica) we change optionValue from 
NVIDIA GeForce RTX to Intel Iris Xe we have to change to DELLV2 sku.

Suggest the values ​​of each option (except the one changed) by taking them from the lowest price of each option associated with the sku variant that belong to the option value selected.

>Parameters

	productCode		int
	variantCode		int
	optionCode		int
	selectedOptionIds 	array
	currentOptionValue	int
	newOptionValue		int
	
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
				"values": [
					{
						"id": 1,
						"name": "Intel Core i3",
						"price": 54.99,
						"select": false,
						"old-select": true
					},
					{
						"id": 2,
						"name": "Intel Core i5",
						"price": 69.00,
						"select": true,
						"old-select": false
					},
					{
						"id": 3,
						"name": "Intel Core i7",
						"price": 133.99,
						"select": false,
						"old-select": false
					}
				]
			},
			{
				"id": 2,
				"name": "S.O.",
				"values": [
					{
						"id": 4,
						"name": "Win 10",
						"price": 26.90,
						"select": false,
						"old-select": true
					},
					{
						"id": 5,
						"name": "Win 11",
						"price": 35.99,
						"select": true,
						"old-select": false
					}
				]
			},
			{
				"id": 2,
				"name": "Scheda Grafica",
				"values": [
					{
						"id": 6,
						"name": "NVIDIA GeForce RTX",
						"price": 659.90,
						"select": false,
						"old-select": true
					},
					{
						"id": 7,
						"name": "Intel Iris Xe",
						"price": 309.99,
						"select": true,
						"old-select": false
					}
				]
			},
			{...}
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

![ER Model](/assets/frontend-data-flow.png)
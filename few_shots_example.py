few_shots = [
    {
        'Question': "How many Adidas t-shirts do we have in XL size?",
        'SQLQuery': "SELECT SUM(stock_quantity) FROM t_shirts WHERE brand = 'Adidas' AND size = 'XL'",
        'SQLResult': "Result of the SQL query",
        'Answer': '134'
    },
    {
        'Question': "What is the total revenue generated if we sell all Puma t-shirts without any discounts?",
        'SQLQuery': "SELECT SUM(price * stock_quantity) FROM t_shirts WHERE brand = 'Puma'",
        'SQLResult': "Result of the SQL query",
        'Answer': "61760"
    },
    {
        'Question': "How many t-shirts are there with a Solid pattern and Short Sleeve from the brand Zara?",
        'SQLQuery': "SELECT SUM(stock_quantity) FROM t_shirts WHERE brand = 'Zara' AND pattern = 'Solid' AND sleeve_length = 'Short Sleeve'",
        'SQLResult': "Result of the SQL query",
        'Answer': "92"
    },{
        'Question': "How many t-shirts from the brand Levi have 'Long Sleeve'?",
        'SQLQuery': "SELECT SUM(stock_quantity) FROM t_shirts WHERE brand = 'Levi' AND sleeve_length = 'Long Sleeve'",
        'SQLResult': "Result of the SQL query",
        'Answer': "252"
    },
    {
        'Question': "What is the total price of the inventory for all Nike t-shirts?",
        'SQLQuery': "SELECT SUM(price * stock_quantity) FROM t_shirts WHERE brand = 'Nike'",
        'SQLResult': "Result of the SQL query",
        'Answer': "40238"
    },
    {
        'Question': "How many t-shirts from the brand H&M are available in Black color?",
        'SQLQuery': "SELECT SUM(stock_quantity) FROM t_shirts WHERE brand = 'H&M' AND color = 'Black'",
        'SQLResult': "Result of the SQL query",
        'Answer': "65"
    },
    {
        'Question': "What is the average price of all Adidas t-shirts?",
        'SQLQuery': "SELECT AVG(price) FROM t_shirts WHERE brand = 'Adidas'",
        'SQLResult': "Result of the SQL query",
        'Answer': "224.66"
    },
    {
        'Question': "How many t-shirts from the brand Under Armour have a 'Printed' pattern?",
        'SQLQuery': "SELECT SUM(stock_quantity) FROM t_shirts WHERE brand = 'Under Armour' AND pattern = 'Printed'",
        'SQLResult': "Result of the SQL query",
        'Answer': "139"
    }
    
]


/*
The ALTER TABLE MODIFY COLUMN statement in SQL is used to change the definition of an existing column in a table. 
This can include altering the column’s data type, length, or constraints.
Syntax
ALTER TABLE table_name
MODIFY COLUMN column_name new_datatype [constraints];

	ALTER TABLE table_name:
		ALTER TABLE is the SQL command used to modify the structure of an existing table.
		table_name is the name of the table containing the column you want to modify.
	MODIFY COLUMN column_name:
		MODIFY COLUMN specifies that you are changing an existing column.
		column_name is the name of the column you want to modify.
	new_datatype:
		Specifies the new data type for the column. This can be a different data type or a modification of the existing data type.
	[constraints]:
		Optional constraints that apply to the column, such as NOT NULL, DEFAULT, or UNIQUE.
        
	Data Conversion:
		When changing the data type, the database will attempt to convert existing data to the new type. Ensure that the conversion is valid and that existing data will not be truncated or lost.
	Constraints:
		Adding or modifying constraints can enforce data integrity. Be cautious when applying constraints to ensure they do not cause issues with existing data.
	Impact on Data:
		Modifying columns can affect existing data, especially when changing data types or constraints. Review and test modifications to avoid data integrity issues.
	Database Specifics:
		Syntax and support for MODIFY COLUMN may vary between different SQL databases (e.g., MySQL, PostgreSQL, SQL Server). Check your database documentation for specific details.
*/

-- change the datatype scale , precession
alter table employees modify column salary decimal(15,2);

-- add constraints using (Column level)
alter table employees modify column birth_date date not null default (current_date);

-- insert a record
INSERT INTO `ddl`.`employees` (`first_name`, `last_name`, `email`, `hire_date`, `salary`, `middle_name`) VALUES ('Alex', 'Chan', 'alex@gmail.com', curdate(), 999, 'alex');

-- error situation
alter table employees modify column email varchar(10);
	-- ERROR 1406 (22001): Data too long for column 'email' at row 1

-- completely change the datatype
alter table employees modify column first_name char(50);

truncate table employees;

alter table employees modify column email varchar(10);
    
from now on, I will show my work process in the readme, so that everyone can understand better.
unless it's a long process, then I'll make it in pdf

## the final result of power bi visualization is
![image](https://github.com/user-attachments/assets/dbf56738-7907-4a70-8683-16dfe0b4f833)

recomendation based on calculation of sum of riders, sum of revenue, sum of profit , and average of price

![image](https://github.com/user-attachments/assets/99b64a5e-bc74-4c13-9d4a-8cb3d4da942d)

![image](https://github.com/user-attachments/assets/8ce5a020-d8a0-469c-b024-b267fd0b8cbe)

# TomanBikeShare

<p align="center">
  <img src="https://github.com/user-attachments/assets/19f85cfa-d7aa-4800-a196-483dd8cd375d" width="600" height="500" />
</p>

# Requirements :
1.  Hourly revenue analysis
2.  Profit and Revenue Trends
3.  Seasonal Revenue
4.  Rider Demographics

# process steps


first open SQL server management studio 

we start with create database by right click on folder Databases then click New database

![image](https://github.com/user-attachments/assets/de2ddc5f-40f8-48b9-8e6c-ecdf04a2088e)

on Database name, filled with name bike_data

![image](https://github.com/user-attachments/assets/f3318856-a71a-4801-965d-2f0f3cd47d4c)

now you could see bike_data Databases

![image](https://github.com/user-attachments/assets/5923326d-70e7-4325-aeae-80c563b35d7b)

we can now add tabel to the databases , 

right click on bike_data, then Task, and Import flat file


![image](https://github.com/user-attachments/assets/25cf6061-1c5e-48d5-a273-6d614143d2dd)

windows will appear, then click just next
<p align="left">
  <image src="https://github.com/user-attachments/assets/4b958c56-0316-4ee7-8a68-b49c0f2d4784" width = 50% height=50% />
  </p>
then click browse to find the file
the file name is in the attachment on this github, you can download it

first we enter a file called bike_share_yr_0.csv
<p align="left">
<image src="https://github.com/user-attachments/assets/81df8b3f-7674-40d4-ac02-7f418995a177" width = 50% heigh=50% />
</p>

then click next

a preview of the data will appear, 

<image src="https://github.com/user-attachments/assets/0446c9cb-439c-438f-9e21-ca2b183f652e" width=50% heigh=50% />

to note here, click uncheck at the bottom of the preview table

![image](https://github.com/user-attachments/assets/d6287495-4850-4a9c-879d-f690e34c9237)

modify column will appear, we can change the data type and column name, then click next, 
after the summary is shown, click finish
<image src=
"https://github.com/user-attachments/assets/6e8c8e4b-b0cc-4a9a-8bd2-14feaf8ee9fc" width=50% heigh=50% />

the next step is to click refresh located at the top 

![image](https://github.com/user-attachments/assets/87c0e8f8-40f4-4690-8bce-eefb5deec15c)

a table called dbo.bike_share_yr_0 has been inserted into the bike_data database. 

![image](https://github.com/user-attachments/assets/bcd0c40b-db63-4596-a64c-a57c095392d9)

To view the table contents, right-click on the table you want to view. then click select top 1000 rows

![image](https://github.com/user-attachments/assets/b4a6a056-b47c-4936-b8b6-6d16beb59905)

the result is the content of the table (1000 rows) and the SQL query

![image](https://github.com/user-attachments/assets/6d95ae0a-089d-4bef-9daf-fd5c4327f0c5)

#### we can add 2 other files namely dbo.bike_share_yr_1 and dbo.cost_table 
#### in the way that I have described above
#### after refreshing, the 3 files have been entered into the bike_data databases.

![image](https://github.com/user-attachments/assets/8672ed39-1e45-44bd-bd44-0b7c372c9ebc)

we will now increase the font size of the script display and result display

The method is, on the main menu, select tools, then options

#### an Options window will appear

![image](https://github.com/user-attachments/assets/8d47360d-e15e-4c89-91f1-3b9f142cac7e)

#### choose Environment then Fonts and Colors

![image](https://github.com/user-attachments/assets/8b463048-4cb6-41e3-bd27-44d2c004fe8c)

#### on the "show settings for", choose Grid Results, we can change Font and size, 
#### I prefer using Arial font with size 12, then OK
![image](https://github.com/user-attachments/assets/3b2b99e9-fb05-4ddc-b610-8d89bee1d91b)

to be able to see the changes, the application must be restarted first

we go back to table dbo.bike_share_yr_0 
now we block all the sql coding, to be deleted 
press Delete key on the keyboard

![image](https://github.com/user-attachments/assets/a4a454e3-a72a-47f6-aab8-0e4966b3729c)

we will merge the two files bike_share_yr_0 and bike_share_yr_1, using the union function
```sql
select * from bike_share_yr_0
union
select * from bike_share_yr_1
```
We can see the result at the bottom right of the result query, where the number of rows is 34,758.

![image](https://github.com/user-attachments/assets/0d1b934e-b771-4118-ab29-91b505499657)

we will see the contents of the cost_table query 

![image](https://github.com/user-attachments/assets/528d734d-0dc8-41ce-9fd2-51a129b8f13d)

we will join the table previously formed with the cost_table query, 
here we see the cost table can join the main table through the yr column
we will join using the left join function and CTE (Common Table Expression) 
We can see the combined table between bike_share_yr_0 and yr_1 as follows :

![image](https://github.com/user-attachments/assets/b343a222-bca5-4555-a65f-4d596caa2d3d)

```sql
with cte as(
	select * from bike_share_yr_0
	union
	select * from bike_share_yr_1)
-- Main Query
select * from cte a
left join cost_table b
on a.yr = b.yr
```

The result is that there are additional new columns, namely price and COGS, to the right of the main column.

![image](https://github.com/user-attachments/assets/6ad63dcc-5b95-40fb-9cc4-b7cd0409101a)

we will use just some columns,
```sql
with cte as(
	select * from bike_share_yr_0
	union
	select * from bike_share_yr_1)

select 
dteday,
season,
a.yr,
weekday,
hr,
rider_type,
riders,
price,
COGS

from cte a
left join cost_table b
on a.yr = b.yr
```
the results are

![image](https://github.com/user-attachments/assets/9f390308-d916-49a6-b2a6-7c3e45a24cf7)

we also add revenue column which is the multiplication of the rider column by the price
and Profit Column which is multiplication of rider x price minus COGS

![image](https://github.com/user-attachments/assets/b87785a6-e006-42a2-868c-44bdb57f4f8a)

```sql
with cte as(
	select * from bike_share_yr_0
	union
	select * from bike_share_yr_1)

select 
dteday,
season,
a.yr,
weekday,
hr,
rider_type,
riders,
price,
COGS,
riders*price as Revenue,
riders*price - COGS as Profit

from cte a
left join cost_table b
on a.yr = b.yr
```
the final result are

![image](https://github.com/user-attachments/assets/74b9e471-40df-4b63-ab60-365512b3f70a)

we will use this query to make a visualization in power BI.
In order for this query to connect with Power BI, we need to know the server type and server name. 
The first step is:
at the top of Object Explorer menu, click server name, then right click, choose connect

![image](https://github.com/user-attachments/assets/0be7e33c-6e56-4a7b-b3c1-c4bfcd877a48)

we can identify its server name, my server name is HOME-PC1 , block and copy the server name

![image](https://github.com/user-attachments/assets/22406e0e-9e70-45d5-9cb8-5efa13e3930b)

now open the microsoft power bi desktop application
on menu click get data, then Server Name
we then fill in server name and database name

![image](https://github.com/user-attachments/assets/12294fbe-0ab7-4086-b2ac-7d6a7b3836f9)

then click Advanced Option to fill in SQL Statement

we then open SQL SMS to copy the final query

![image](https://github.com/user-attachments/assets/992d972f-f785-4154-a400-130be460585f)

then paste it on SQL Server database windows which is in power bi

![image](https://github.com/user-attachments/assets/a6d47dc9-bf6b-4167-8bcb-beb8bb93a32c)

then click OK
then the windows will appear again, click connect, Then OK

![image](https://github.com/user-attachments/assets/e0e9dc05-c6e5-44f3-b21a-74cffc74ce2d)

now we start move on to microsoft power BI desktop
after the process of importing sql query to power BI, 
in the power BI desktop application there will be a window that contains the sql query that we have created.

![image](https://github.com/user-attachments/assets/79a6ce3a-ac95-456e-b077-dcf4cc3b2963)

click Load

We can check whether the query has been entered, by clicking on the table view in the left menu of the Power BI desktop.

![image](https://github.com/user-attachments/assets/1868160d-f374-4276-8a40-4277be905c36)

we now start making the visualization

I will not explain the visualization process in power BI, but you can see the file in the attached file.

there is a slight change to the revenue formula, for that we can change it through the Power BI desktop.

there is a Transform data on top of power BI menu

![image](https://github.com/user-attachments/assets/7b3869f0-14b0-46c4-ab1c-ed822850b307)

data transform windows will appear

![image](https://github.com/user-attachments/assets/37ee7587-83d4-4b40-a5d3-eba72463403d)

on the right side, there is APPLIED STEP menu, click on gear icon beside the text is written Source

![image](https://github.com/user-attachments/assets/07288465-f6a0-41d7-8885-a2b3cd7a7295)

There will be a SQL server database window, in the section labeled “SQL statement”, we will change the sql code

![image](https://github.com/user-attachments/assets/9b57ca1b-25f1-4eab-86cc-9db63b6eb4bf)

we will change this code

![image](https://github.com/user-attachments/assets/668bbb5e-c1a5-4e74-960e-b9e4e250af5d)

become

![image](https://github.com/user-attachments/assets/40f32390-553b-4c3e-adf3-983f974d8be5)

then click OK
on the top left corner, click Close&Apply






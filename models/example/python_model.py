import random


def add_random_int(x):
    return x + random.randint(1, 100000)


def model(dbt, session):

    dbt.config(materialized="table")
    customers = dbt.ref("stg_customers")

    df = customers.withColumn(
        "random_meaningless_column", add_random_int(customers["customer_id"])
    )

    return df

from datetime import datetime
import os


def MyFunction(Name):
    where_is = os.getcwd()
    print("Path: " + where_is + "\n")

    today_is = datetime.today().strftime("%m/%d/%Y, %H:%M:%S")
    print("Hey " + Name + " today is " + today_is)


MyFunction("Mrs. John")

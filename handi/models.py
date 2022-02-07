from django.db import models

# Create your models here.

class District(models.Model):
    DistrictId = models.AutoField(primary_key=True)
    dname=models.CharField(max_length=100)

class Category(models.Model):
    CategoryId = models.AutoField(primary_key=True)
    CategoryName = models.CharField(max_length=30)

class Login(models.Model):
    LoginId = models.AutoField(primary_key=True)
    username = models.CharField(max_length=100)
    password = models.CharField(max_length=100)
    role= models.CharField(max_length=50)
    status=models.IntegerField()

class Location(models.Model):
    LocationId = models.AutoField(primary_key=True)
    LocationName=models.CharField(max_length=100)
    district = models.ForeignKey(District, on_delete=models.CASCADE)

class Agency(models.Model):
    AgencyId = models.AutoField(primary_key=True)
    AgencyName = models.CharField(max_length=100)
    address = models.CharField(max_length=100)
    location = models.ForeignKey(Location, on_delete=models.CASCADE)
    pin = models.CharField(max_length=100)
    email = models.CharField(max_length=100)
    phone=models.CharField(max_length=100)
    LicenseNo = models.CharField(max_length=100)
    login = models.ForeignKey(Login, on_delete=models.CASCADE)

class CustomerReg(models.Model):
    CustomerId = models.AutoField(primary_key=True)
    CusttomerName = models.CharField(max_length=100)
    address = models.CharField(max_length=100)
    location = models.ForeignKey(Location, on_delete=models.CASCADE)
    gender = models.CharField(max_length=100)
    dob = models.CharField(max_length=100)
    email = models.CharField(max_length=100)
    phone = models.CharField(max_length=100)
    login = models.ForeignKey(Login, on_delete=models.CASCADE)


class HandicrafterReg(models.Model):
    HandicrafterId = models.AutoField(primary_key=True)
    HandicrafterName = models.CharField(max_length=100)
    address = models.CharField(max_length=100)
    dob = models.CharField(max_length=100)
    phone = models.CharField(max_length=100)
    email = models.CharField(max_length=100)
    agency = models.ForeignKey(Agency, on_delete=models.CASCADE)
    login = models.ForeignKey(Login, on_delete=models.CASCADE)

class Product(models.Model):
    ProductId = models.AutoField(primary_key=True)
    productname=models.CharField(max_length=100)
    handicarft= models.ForeignKey(HandicrafterReg, on_delete=models.CASCADE)
    agency = models.ForeignKey(Agency, on_delete=models.CASCADE)
    description=models.CharField(max_length=100)
    cat_id = models.ForeignKey(Category, on_delete=models.CASCADE)
    photo=models.ImageField(upload_to='productphoto')
    price=models.IntegerField()
    status=models.IntegerField()

class Cart(models.Model):
    CartId = models.AutoField(primary_key=True)
    product = models.ForeignKey(Product, on_delete=models.CASCADE)
    customer=models.ForeignKey(CustomerReg, on_delete=models.CASCADE)
    price=models.IntegerField()
    noofqunatity=models.IntegerField()
    status = models.IntegerField()

class bank(models.Model):

    BankId=models.AutoField(primary_key=True)
    username=models.CharField(max_length=100)
    cardno=models.BigIntegerField()
    cvv=models.IntegerField()
    balance=models.IntegerField()




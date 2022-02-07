from django.db import models

# Create your models here.
class Login(models.Model):
    username = models.CharField(max_length=100)
    password = models.CharField(max_length=100)
    role= models.CharField(max_length=50)
    status=models.IntegerField()


class Register(models.Model):
    login = models.ForeignKey(Login, on_delete=models.CASCADE)
    firstname = models.CharField(max_length=50)
    lastname = models.CharField(max_length=50)
    middlename = models.CharField(max_length=50)
    email = models.CharField(max_length=50)
    role= models.CharField(max_length=50)
class District(models.Model):
    dname=models.CharField(max_length=100)

class Category(models.Model):
    cat_name=models.CharField(max_length=100)

class Agency(models.Model):
    Aname = models.CharField(max_length=100)
    address = models.CharField(max_length=100)
    district = models.ForeignKey(District, on_delete=models.CASCADE)
    pin = models.IntegerField()
    email = models.CharField(max_length=100)
    phone=models.IntegerField()
    login = models.ForeignKey(Login, on_delete=models.CASCADE)

class Coustomerreg(models.Model):
        Cname = models.CharField(max_length=100)
        address = models.CharField(max_length=100)
        district = models.ForeignKey(District, on_delete=models.CASCADE)
        gender=models.CharField(max_length=100)
        dob=models.DateField()
        email = models.CharField(max_length=100)
        phone = models.IntegerField()
        login = models.ForeignKey(Login, on_delete=models.CASCADE)

class HandiReg(models.Model):
    Hname = models.CharField(max_length=100)
    address = models.CharField(max_length=100)
    dob = models.DateField()
    phone = models.IntegerField()
    agency = models.ForeignKey(Agency,on_delete=models.CASCADE)
    login = models.ForeignKey(Login, on_delete=models.CASCADE)

class Bidd(models.Model):
    startdata=models.DateField()
    enddata=models.DateField()
    startingprice= models.IntegerField()
    status=models.IntegerField()
    highestprice=models.IntegerField()
    login = models.ForeignKey(Login, on_delete=models.CASCADE)

class Biddrequest(models.Model):
    productname=models.CharField(max_length=100)
    cat_id=models.ForeignKey(Category, on_delete=models.CASCADE)
    description=models.CharField(max_length=100)
    basicprice=models.IntegerField()
    agency=models.ForeignKey(Agency, on_delete=models.CASCADE)
    quanlity=models.IntegerField()
    image=models.ImageField()
    status=models.IntegerField()
    handicarft=models.ForeignKey(HandiReg, on_delete=models.CASCADE)

class Product(models.Model):
    productname=models.CharField(max_length=100)
    handicarft= models.ForeignKey(HandiReg, on_delete=models.CASCADE)
    agency = models.ForeignKey(Agency, on_delete=models.CASCADE)
    description=models.CharField(max_length=100)
    cat_id = models.ForeignKey(Category, on_delete=models.CASCADE)
    photo=models.ImageField(upload_to='pdt')
    price=models.IntegerField()
    status=models.IntegerField()

class Event(models.Model):
    title=models.CharField(max_length=100)
    type=models.CharField(max_length=100)
    details=models.CharField(max_length=100)
    place=models.CharField(max_length=100)
    data= models.DateField()
    time=models.TimeField()
    status=models.IntegerField()

class Cart(models.Model):
    product=models.ForeignKey(Product, on_delete=models.CASCADE)
    coustomer=models.ForeignKey(Coustomerreg, on_delete=models.CASCADE)

class Payment(models.Model):
    username=models.CharField(max_length=100)
    accountno=models.IntegerField()
    cvv=models.IntegerField()
    amount=models.IntegerField()

class Shipping(models.Model):
    name=models.CharField(max_length=100)
    address=models.CharField(max_length=100)
    phone=models.IntegerField()
    pin=models.IntegerField()
    coustomer = models.ForeignKey(Coustomerreg, on_delete=models.CASCADE)
    data = models.DateField()
    status = models.IntegerField()
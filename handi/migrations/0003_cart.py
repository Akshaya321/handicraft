# Generated by Django 2.1.2 on 2020-03-18 09:16

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('handi', '0002_auto_20200313_0949'),
    ]

    operations = [
        migrations.CreateModel(
            name='Cart',
            fields=[
                ('CartId', models.AutoField(primary_key=True, serialize=False)),
                ('price', models.IntegerField()),
                ('noofqunatity', models.IntegerField()),
                ('status', models.IntegerField()),
                ('customer', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='handi.CustomerReg')),
                ('product', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='handi.Product')),
            ],
        ),
    ]

# Generated by Django 2.1.2 on 2020-03-25 10:32

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('handi', '0003_cart'),
    ]

    operations = [
        migrations.CreateModel(
            name='bank',
            fields=[
                ('BankId', models.AutoField(primary_key=True, serialize=False)),
                ('username', models.CharField(max_length=100)),
                ('cardno', models.IntegerField()),
                ('cvv', models.IntegerField()),
                ('balance', models.IntegerField()),
            ],
        ),
    ]

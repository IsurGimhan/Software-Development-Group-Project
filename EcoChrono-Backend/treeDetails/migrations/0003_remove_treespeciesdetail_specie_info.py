# Generated by Django 5.0.1 on 2024-03-19 03:45

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('treeDetails', '0002_treespeciesdetail_delete_treespecies'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='treespeciesdetail',
            name='specie_info',
        ),
    ]
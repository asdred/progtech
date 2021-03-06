<div>
    <div>
        <h2>Автомобили {{ status }}</h2>
    </div>
    <div>
        <div style="text-align: left">
            {{ form("car/index") }}
                <input type="radio" name="capacity" value="max">Наиболее грузоподъёмный</inpu><br>
                <input type="radio" name="capacity" value="min">Наименее грузоподъёмный</inpu><br>
                {{ submit_button("Фильтр", "class": "btn btn-primary") }}
            </form>
        </div>
        {{ link_to("car/new", "Создать", "class": "btn btn-primary") }}
    </div>
</div>


{% for cars in page.items %}
{% if loop.first %}
<table class="table table-bordered table-striped" id="table-info" align="center">
    <thead>
        <tr>
            <th class="hidden">id</th>
            <th>Диллер</th>
            <th>Водитель</th>
            <th>Владелец</th>
            <th>Модель</th>
            <th>Грузоподъемность</th>
            <th colspan="2"></th>
        </tr>
    </thead>
{% endif %}
{% if cars.del == 0 %}
    <tbody>
        <tr>
            <td class="hidden">{{ cars.id }}</td>
            <td>{{ cars.dealer.name }}</td>
            <td>{{ cars.driver.name }}</td>
            <td>{{ cars.owner.name }}</td>
            <td>{{ cars.model }}</td>
            <td>{{ cars.capacity }}</td>
            <td width="7%">{{ link_to("car/edit/" ~ cars.id, '<i class="glyphicon glyphicon-edit"></i> Изменить', "class": "btn btn-default") }}</td>
            <td width="7%">{{ link_to("car/delete/" ~ cars.id, '<i class="glyphicon glyphicon-remove"></i> Удалить', "class": "btn btn-default") }}</td>
        </tr>
    </tbody>
{% endif %}
{% if loop.last %}
    <tbody>
        <tr>
            <td colspan="7" align="right">
                <div class="btn-group">
                    {{ link_to("car/index/", '<i class="icon-fast-backward"></i> Первая', "class": "btn btn-default") }}
                    {{ link_to("car/index/" ~ page.before, '<i class="icon-step-backward"></i> Предыдущая', "class": "btn btn-default") }}
                    {{ link_to("car/index/" ~ page.next, '<i class="icon-step-forward"></i> Следующая', "class": "btn btn-default") }}
                    {{ link_to("car/index/" ~ page.last, '<i class="icon-fast-forward"></i> Последняя', "class": "btn btn-default") }}
                    <span class="help-inline">{{ page.current }}/{{ page.total_pages }}</span>
                </div>
            </td>
        </tr>
    <tbody>
</table>
{{ link_to("export/index/car", "Экспорт", "class": "btn btn-primary") }}
{% endif %}
{% else %}
    No companies are recorded
{% endfor %}
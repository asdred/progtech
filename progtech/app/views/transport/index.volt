<h2>Перевозки</h2>

{% for transport in page.items %}
{% if loop.first %}
<table class="table table-bordered table-striped" align="center">
    <thead>
        <tr>
            <th>Номер</th>
            <th>Авто</th>
            <th>Организация</th>
            <th>Склад</th>
            <th>Дата</th>
        </tr>
    </thead>
{% endif %}
    <tbody>
        <tr>
            <td>{{ transport.id }}</td>
            <td>{{ transport.car.model }}</td>
            <td>{{ transport.organization.name }}</td>
            <td>{{ transport.store.name }}</td>
            <td>{{ transport.date }}</td>
            <td width="7%">{{ link_to("transport/edit/" ~ transport.id, '<i class="glyphicon glyphicon-edit"></i> Изменить', "class": "btn btn-default") }}</td>
            <td width="7%">{{ link_to("transport/delete/" ~ transport.id, '<i class="glyphicon glyphicon-remove"></i> Удалить', "class": "btn btn-default") }}</td>
        </tr>
    </tbody>
{% if loop.last %}
    <tbody>
        <tr>
            <td colspan="7" align="right">
                <div class="btn-group">
                    {{ link_to("transport/index/", '<i class="icon-fast-backward"></i> Первая', "class": "btn btn-default") }}
                    {{ link_to("transport/index/" ~ page.before, '<i class="icon-step-backward"></i> Предыдущая', "class": "btn btn-default") }}
                    {{ link_to("transport/index/" ~ page.next, '<i class="icon-step-forward"></i> Следующая', "class": "btn btn-default") }}
                    {{ link_to("transport/index/" ~ page.last, '<i class="icon-fast-forward"></i> Последняя', "class": "btn btn-default") }}
                    <span class="help-inline">{{ page.current }}/{{ page.total_pages }}</span>
                </div>
            </td>
        </tr>
    <tbody>
</table>
{% endif %}
{% else %}
    No companies are recorded
{% endfor %}


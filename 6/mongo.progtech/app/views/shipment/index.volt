<div>
    <div>
        <h2>Грузы</h2>
    </div>
    <div>
        {{ link_to("shipment/new", "Создать", "class": "btn btn-primary") }}
    </div>
</div>

{% for shipment in page.items %}
{% if loop.first %}
<table class="table table-bordered table-striped" id="table-info" align="center">
    <thead>
        <tr>
            <th class="hidden">id</th>
            <th>Продукт</th>
            <th>Номер перевозки</th>
            <th>Количество (м^3)</th>
            <th colspan="2"></th>
        </tr>
    </thead>
{% endif %}
{% if shipment.del == 0 %}
    <tbody>
        <tr>
            <?php $product = Product::findFirst(array(array("id" => (int)$shipment->product_id)))->name; ?>
            <td class="hidden">{{ shipment.id }}</td>
            <td>{{ product }}</td>
            <td>{{ shipment.transportation_id }}</td>
            <td>{{ shipment.amount }}</td>
            <td width="7%">{{ link_to("shipment/edit/" ~ shipment.id, '<i class="glyphicon glyphicon-edit"></i> Изменить', "class": "btn btn-default") }}</td>
            <td width="7%">{{ link_to("shipment/delete/" ~ shipment.id, '<i class="glyphicon glyphicon-remove"></i> Удалить', "class": "btn btn-default") }}</td>
        </tr>
    </tbody>
{% endif %}
{% if loop.last %}
    <tbody>
        <tr>
            <td colspan="7" align="right">
                <div class="btn-group">
                    {{ link_to("shipment/index/", '<i class="icon-fast-backward"></i> Первая', "class": "btn btn-default") }}
                    {{ link_to("shipment/index/" ~ page.before, '<i class="icon-step-backward"></i> Предыдущая', "class": "btn btn-default") }}
                    {{ link_to("shipment/index/" ~ page.next, '<i class="icon-step-forward"></i> Следующая', "class": "btn btn-default") }}
                    {{ link_to("shipment/index/" ~ page.last, '<i class="icon-fast-forward"></i> Последняя', "class": "btn btn-default") }}
                    <span class="help-inline">{{ page.current }}/{{ page.total_pages }}</span>
                </div>
            </td>
        </tr>
    <tbody>
</table>
{{ link_to("export/index/shipment", "Экспорт", "class": "btn btn-primary") }}
{% endif %}
{% else %}
    No companies are recorded
{% endfor %}


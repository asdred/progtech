<div>
    <div>
        <h2>Товары {{ status }}</h2>
    </div>
    <div>
        <div style="text-align: left">
            {{ form("product/index") }}
                <input type="radio" name="filter" value="max">Наибольший вес</inpu><br>
                <input type="radio" name="filter" value="min">Наименьший вес</inpu><br>
                {{ submit_button("Фильтр", "class": "btn btn-primary") }}
            </form>
        </div>
        {{ link_to("product/new", "Создать", "class": "btn btn-primary") }}
    </div>
</div>

{% for product in page.items %}
{% if loop.first %}
<table class="table table-bordered table-striped" id="table-info" align="center">
    <thead>
        <tr>
            <th class="hidden">id</th>
            <th>Название</th>
            <th>Масса 1 м^3 (кг)</th>
            <th>Тип</th>
            <th colspan="2"></th>
        </tr>
    </thead>
{% endif %}
{% if product.del == 0 %}
    <tbody>
        <tr>
            <?php $product_type = ProductType::findFirst(array(array("id" => (int)$product->type_id)))->name; ?>
            <td class="hidden">{{ product.id }}</td>
            <td>{{ product.name }}</td>
            <td>{{ product.weight }}</td>
            <td>{{ product_type }}</td>
            <td width="7%">{{ link_to("product/edit/" ~ product.id, '<i class="glyphicon glyphicon-edit"></i> Изменить', "class": "btn btn-default") }}</td>
            <td width="7%">{{ link_to("product/delete/" ~ product.id, '<i class="glyphicon glyphicon-remove"></i> Удалить', "class": "btn btn-default") }}</td>
        </tr>
    </tbody>
{% endif %}
{% if loop.last %}
    <tbody>
        <tr>
            <td colspan="7" align="right">
                <div class="btn-group">
                    {{ link_to("product/index/", '<i class="icon-fast-backward"></i> Первая', "class": "btn btn-default") }}
                    {{ link_to("product/index/" ~ page.before, '<i class="icon-step-backward"></i> Предыдущая', "class": "btn btn-default") }}
                    {{ link_to("product/index/" ~ page.next, '<i class="icon-step-forward"></i> Следующая', "class": "btn btn-default") }}
                    {{ link_to("product/index/" ~ page.last, '<i class="icon-fast-forward"></i> Последняя', "class": "btn btn-default") }}
                    <span class="help-inline">{{ page.current }}/{{ page.total_pages }}</span>
                </div>
            </td>
        </tr>
    <tbody>
</table>
{{ link_to("export/index/product", "Экспорт", "class": "btn btn-primary") }}
{% endif %}
{% else %}
    No companies are recorded
{% endfor %}


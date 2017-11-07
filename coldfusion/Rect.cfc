component accessors='true'
{
    property name='size' type='numeric' getter='true' setter='true';
    public component function init(required numeric size) {
        variables.size = size;
        return this;
    }
}

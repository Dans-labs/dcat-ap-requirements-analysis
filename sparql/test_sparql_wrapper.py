from SPARQLWrapper import SPARQLWrapper, JSON

sparql = SPARQLWrapper(
    "https://semiceu.github.io/DCAT-AP/releases/3.0.0/html/shacl/shapes.ttl"
    "https://semiceu.github.io/DCAT-AP/releases/3.0.0/html/shacl/range.ttl"

)
sparql.setReturnFormat(JSON)

# gets the first 3 geological ages
# from a Geological Timescale database,
# via a SPARQL endpoint
sparql.setQuery("""
    PREFIX gts: <http://resource.geosciml.org/ontology/timescale/gts#>

    SELECT *
    WHERE {
        ?a a gts:Age .
    }
    ORDER BY ?a
    LIMIT 3
    """
)

try:
    ret = sparql.queryAndConvert()

    for r in ret["results"]["bindings"]:
        print(r)
except Exception as e:
    print(e)

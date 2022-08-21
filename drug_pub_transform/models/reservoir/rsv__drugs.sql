select *
from {{ ref('seed', 'drugs') }}
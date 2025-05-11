# DDL

```sql
--- 급부
DROP TABLE IF EXISTS PUBLIC.BENEFITS;
CREATE TABLE PUBLIC.BENEFITS (
    ID UUID PRIMARY KEY DEFAULT gen_random_uuid()
    , CATEGORY TEXT NOT NULL -- 급부분류
    , RISK_UNIT_CODE TEXT -- 위험단위코드
    , NAME TEXT NOT NULL UNIQUE -- 급부명
    -- 메타데이터 --
    , CREATED_AT TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW()
    , UPDATED_AT TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW()
    , CREATED_BY TEXT NOT NULL DEFAULT 'karma'
    , UPDATED_BY TEXT NOT NULL DEFAULT 'karma'
) TABLESPACE PG_DEFAULT;

--- 대표담보
DROP TABLE IF EXISTS PUBLIC.REPR_COVS;
CREATE TABLE PUBLIC.REPR_COVS (
    ID UUID PRIMARY KEY DEFAULT gen_random_uuid()
    , CODE UUID NOT NULL UNIQUE -- 대표담보코드
    , NAME TEXT NOT NULL UNIQUE -- 대표담보코드명
    , TYPE TEXT NOT NULL -- 담보유형(급부1/급부N/세부보장N)
    , SEQ INT NOT NULL DEFAULT 0 -- 순번
    , BENEFIT_ID UUID NOT NULL -- 급부ID
    , DETAILED_COV_NAME TEXT -- 세부보장명
    , CATEGORY TEXT NOT NULL -- 담보분류(상해,질병,상해및질병 등)
    -- 메타데이터 --
    , CREATED_AT TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW()
    , UPDATED_AT TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW()
    , CREATED_BY TEXT NOT NULL DEFAULT 'karma'
    , UPDATED_BY TEXT NOT NULL DEFAULT 'karma'
    -- 제약조건 --
    , UNIQUE(CODE, NAME)
    , UNIQUE(CODE, TYPE)
    , UNIQUE(CODE, CATEGORY)
    , UNIQUE(CODE, SEQ)
    , UNIQUE(CODE, BENEFIT_ID)
    , CONSTRAINT REPR_COV_FKEY FOREIGN KEY (BENEFIT_ID)
    REFERENCES PUBLIC.BENEFITS(ID)
) TABLESPACE PG_DEFAULT;
```

# RPC

```
CREATE OR REPLACE FUNCTION public.fetch_all_grouped_repr_cov()
RETURNS TABLE(
    code      UUID,
    name      TEXT,
    type      TEXT,
    category  TEXT,
    details   JSONB
) AS $$
SELECT
    r.code,
    r.name,
    r.type,
    r.category,
    json_agg(
        json_build_object(
            'seq',                r.seq,
            'benefit_id',         b.id,
            'benefit_name',       b.name,
            'risk_unit_code',     b.risk_unit_code,
            'detailed_cov_name',  r.detailed_cov_name
        )
        ORDER BY r.seq
    ) AS details
FROM public.repr_covs AS r
JOIN public.benefits AS b
    ON r.benefit_id = b.id
GROUP BY
    r.code,
    r.name,
    r.type,
    r.category;
$$
LANGUAGE SQL
STABLE;
```

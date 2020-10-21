SELECT d.designer_no,
	SUM(
	(
		SELECT SUM(mdp_price)
		FROM members_detail_paylist
		WHERE mdr_no = r.mdr_no
	)
	)AS ammount
FROM members_designer_rsv r
JOIN designer d
ON
	(
		r.designer_no = d.designer_no
	)
WHERE d.hs_no                      = 2
AND d.DESIGNER_ACCESS_STATUS       = 1
AND r.mdr_status                  IN( 'i2','i3','i4')
AND TO_CHAR(r.mdr_date,'yy-mm-dd') = TO_CHAR(SYSDATE,'yy-mm-dd')
GROUP BY d.designer_no ;
SELECT *
FROM members_designer_rsv r
JOIN members_detail_paylist p
ON
	(
		r.mdr_no = p.mdr_no
	)
ORDER BY mdr_date DESC;
SELECT *
FROM designer;
SELECT SUM(p.mdp_price) AS sales
	--COUNT( * )             AS rsv,
	--r.mdr_date
FROM designer d
JOIN members_designer_rsv r
ON
	(
		d.designer_no = r.designer_no
	)
JOIN members_detail_paylist p
ON
	(
		r.mdr_no = p.mdr_no
	)
WHERE d.designer_no = 125
AND mdr_date BETWEEN TO_CHAR(sysdate - 1,'yy-mm-dd') AND TO_CHAR(sysdate + 1,
	'yy-mm-dd')
AND mdr_status IN ( 'i2', 'i3', 'i4' )
GROUP BY TO_CHAR( r.mdr_date,'yy-mm-dd')
ORDER BY mdr_date;
SELECT *
FROM members_designer_rsv
ORDER BY mdr_date DESC;

SELECT SUM(k.mdp_price)AS sales,
COUNT(*) cnt, 
ddd
FROM (SELECT d.*, r.*, p.*, TO_CHAR(mdr_date, 'yyyy-mm-dd') as ddd
      FROM designer d
      JOIN members_designer_rsv r
      ON d.designer_no = r.designer_no
      JOIN members_detail_paylist p
      ON r.mdr_no = p.mdr_no
      WHERE d.designer_no = 125
      AND mdr_date BETWEEN TO_CHAR(sysdate - 1,'yy-mm-dd') AND TO_CHAR(sysdate + 1, 'yy-mm-dd')
      AND mdr_status IN ( 'i2', 'i3', 'i4' )) k
GROUP BY ddd;



   select QNA_NO ,QNA_SHOP_CUSTOMER_NO ,QNA_TITLE
      ,QNA_CONTENTS
      ,QNA_WRITEDATE ,QNA_OPENSTATUS ,QNA_HITS,QNA_CATEGORY
      ,EMP_NO ,QNA_WHO
      ,QNA_REF,QNA_REPOS,QNA_LEVEL,QNA_WRITER ,
      (select
      c.code_info from code
      c
      where c.secondary_code=q.qna_who) as qna_whov,
      (select z.code_info
      from code z where z.secondary_code=q.qna_category)
      as
      qna_categoryv,
      (select count(qna_no) from qna r where
      qna_ref=q.qna_no) as
      answerstatus
      FROM qna q;
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 SELECT         h.hhi_name,         tmac.tmac_name,         tmic.tmic_explication,  
				      m.mem_sex,         d.designer_name,         AVG(rv.hr_rate) as hr_rate,  
				      COUNT(*) as cnt,         ROW_NUMBER() OVER(             PARTITION BY mem_sex  
				          ORDER BY                 COUNT(*) DESC         ) rank     FROM  
				      hairshop_hair_info      h         JOIN mem_designer_rsv_info   i ON ( h.hhi_no = i.hhi_no )  
				      JOIN members_designer_rsv    r ON ( r.mdr_no = i.mdr_no )  
				      JOIN members                 m ON ( r.mem_no = m.mem_no )  
				      JOIN tt_middle_category      tmic ON ( tmic.tmic_no = h.tmic_no )  
				      JOIN tt_main_category        tmac ON ( tmac.tmac_no = tmic.tmac_no )         JOIN (  
				          SELECT                 a.hhi_name,                 a.designer_name             FROM  
				              (                     SELECT                         d.designer_name,  
				                      h.hhi_name,                         COUNT(*) ,  
				                      ROW_NUMBER() OVER(                             PARTITION BY h.hhi_name  
				                          ORDER BY                                 COUNT(*) DESC  
				                      ) ranking                     FROM  
				                      hairshop_hair_info      h  
				                      JOIN mem_designer_rsv_info   i ON ( h.hhi_no = i.hhi_no )  
				                      JOIN members_designer_rsv    r ON ( r.mdr_no = i.mdr_no )  
				                      JOIN designer                d ON ( d.designer_no = r.designer_no )  
				                  GROUP BY                         h.hhi_name,  
				                      d.designer_name                 ) a             WHERE  
				              a.ranking < 2         ) d ON ( d.hhi_name = h.hhi_name )  
				      LEFT OUTER JOIN hairshop_reviews        rv ON ( rv.mdr_no = r.mdr_no )     WHERE  
				      r.hs_no = 2    GROUP BY  
				      h.hhi_name,         tmac.tmac_name,         tmic.tmic_explication,         m.mem_sex,  
				      d.designer_name,         rv.hr_rate;
					 
					 
					 
					 
					 
					 
					 
					 
					 
					 
					 
					 
					 
					 
					 
					 
					 select m.mem_name as kk, QNA_NO ,QNA_SHOP_CUSTOMER_NO ,QNA_TITLE
      ,QNA_CONTENTS
      ,QNA_WRITEDATE ,QNA_OPENSTATUS ,QNA_HITS,QNA_CATEGORY
      ,EMP_NO ,QNA_WHO
      ,QNA_REF,QNA_REPOS,QNA_LEVEL,QNA_WRITER ,
      ( select c.code_info 
        from code c
        where c.secondary_code=q.qna_who) as qna_whov, 
      ( select z.code_info
        from code z 
        where z.secondary_code=q.qna_category) as qna_categoryv,
      ( select count(qna_no)
        from qna r 
        where qna_ref=q.qna_no) as answerstatus
from qna q
join members m
on q.qna_shop_customer_no = m.mem_no
where qna_who = 'j2'
UNION
select h.hs_name as kk, QNA_NO ,QNA_SHOP_CUSTOMER_NO ,QNA_TITLE
      ,QNA_CONTENTS
      ,QNA_WRITEDATE ,QNA_OPENSTATUS ,QNA_HITS,QNA_CATEGORY
      ,EMP_NO ,QNA_WHO
      ,QNA_REF,QNA_REPOS,QNA_LEVEL,QNA_WRITER ,
      ( select c.code_info 
        from code c
        where c.secondary_code=q.qna_who) as qna_whov, 
      ( select z.code_info
        from code z 
        where z.secondary_code=q.qna_category) as qna_categoryv,
      ( select count(qna_no)
        from qna r 
        where qna_ref=q.qna_no) as answerstatus
from qna q
join hairshop h
ON q.qna_shop_customer_no = h.hs_no
where qna_who = 'j1';


select * from qna where qna_who = 'j1';
-- busca de elementos

select node.nod_id, node.mol_id,node.host_name,node.instance,node.metric_clq_id, node_root.ip as ip_root, node_root.host_name as host_name_root from node
inner join node as node_root on node.root_master_id = node_root.nod_id
where node_root.host_name like
(
'PLANALTO SUL 0010'
) and node_root.mol_id = 10276;

-- buscar somente nod_id
select node.nod_id from node
inner join node as node_root on node.root_master_id = node_root.nod_id
where node_root.host_name in
(
'PLANALTO SUL 0010'
);

select * from node_property where nod_id in (select node.nod_id from node
inner join node as node_root on node.root_master_id = node_root.nod_id
where node_root.host_name in
(
'PLANALTO SUL 0010'
)) and pro_id = 494;

-- Inserir a Propriedade NODE MANAGER NAME (pro_id 494) manualmente
INSERT INTO node_property (nod_id, pro_id, dt_ini,dt_end, value, collected,keep_value, tz_ini, tz_end, source_value) VALUES (75968, 494, '2017-06-26 13:44',NULL, 'wlsgto_ms422','wlsgto_ms422','0', '-3','-3','300');

--comment

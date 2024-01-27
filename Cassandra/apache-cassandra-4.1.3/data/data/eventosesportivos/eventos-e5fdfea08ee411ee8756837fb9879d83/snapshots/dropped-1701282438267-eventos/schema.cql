CREATE TABLE IF NOT EXISTS eventosesportivos.eventos (
    id_evento int PRIMARY KEY,
    data_fim timestamp,
    data_inicio timestamp,
    descricao text,
    local text,
    nome_evento text,
    categorias set<text>
) WITH ID = e5fdfea0-8ee4-11ee-8756-837fb9879d83
    AND additional_write_policy = '99p'
    AND bloom_filter_fp_chance = 0.01
    AND caching = {'keys': 'ALL', 'rows_per_partition': 'NONE'}
    AND cdc = false
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy', 'max_threshold': '32', 'min_threshold': '4'}
    AND compression = {'chunk_length_in_kb': '16', 'class': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND memtable = 'default'
    AND crc_check_chance = 1.0
    AND default_time_to_live = 0
    AND extensions = {}
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair = 'BLOCKING'
    AND speculative_retry = '99p';
CREATE INDEX IF NOT EXISTS eventos_nome_evento_idx ON eventosesportivos.eventos (nome_evento);
CREATE INDEX IF NOT EXISTS eventos_categorias_idx ON eventosesportivos.eventos (values(categorias));

use terminal_buses;

-- Auditoría 
SET GLOBAL general_log_file = 'general.log';
SET GLOBAL general_log = 'ON';

INSTALL PLUGIN server_audit SONAME 'server_audit.so';
SET GLOBAL server_audit_logging = 'ON';
SET GLOBAL server_audit_events = 'CONNECT,QUERY,TABLE';
SET GLOBAL server_audit_file_path = 'audit.log';


SHOW VARIABLES LIKE 'general_log%';
SHOW GLOBAL VARIABLES LIKE 'plugin_dir';








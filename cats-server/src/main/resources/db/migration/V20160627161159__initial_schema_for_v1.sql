/*==============================================================*/
/* DBMS name:      PostgreSQL 9.x                               */
/* Created on:     7/5/2016 9:30:04 AM                          */
/*==============================================================*/


/*==============================================================*/
/* Table: bid                                                   */
/*==============================================================*/
create table bid (
   id                   serial not null,
   start_date           date                 null,
   end_date             date                 null,
   bid_number           varchar(20)          null,
   description          text                 null,
   opening_date         date                 null,
   plan_id              int4                 null,
   status               int4                 null,
   archived             bool                 null,
   region_id            int4                 null,
   document_price       decimal              null,
   cpo_deposit_amount   decimal              null,
   constraint pk_bid primary key (id)
);

/*==============================================================*/
/* Table: bid_plan                                              */
/*==============================================================*/
create table bid_plan (
   id                   serial not null,
   year                 varchar(4)           null,
   half_year            int4                 null,
   program_id           int4                 null,
   code                 varchar(10)          null,
   description          text                 null,
   constraint pk_bid_plan primary key (id)
);

/*==============================================================*/
/* Table: bid_plan_line_item                                    */
/*==============================================================*/
create table bid_plan_line_item (
   id                   serial not null,
   plan_id              int4                 null,
   destination_         int4                 null,
   source_store_id      int4                 null,
   quantity             int4                 null,
   constraint pk_bid_plan_line_item primary key (id)
);

/*==============================================================*/
/* Table: budget_type                                           */
/*==============================================================*/
create table budget_type (
   id                   serial not null,
   name                 varchar(50)          not null,
   description          text                 null,
   constraint pk_budget_type primary key (id)
);

/*==============================================================*/
/* Table: commodity                                             */
/*==============================================================*/
create table commodity (
   id                   serial not null,
   commodity_type_id    int4                 null,
   category_id          int4                 null,
   unit_of_measure_id   int4                 null,
   name                 varchar(100)         null,
   long_name            varchar(200)         null,
   code                 varchar(10)          null,
   description          text                 null,
   hazardous            int4                 null,
   cold_storage         int4                 null,
   min_temperature      float8               null,
   max_temperature      float8               null,
   constraint pk_commodity primary key (id)
);

/*==============================================================*/
/* Table: commodity_category                                    */
/*==============================================================*/
create table commodity_category (
   id                   serial not null,
   name                 varchar(100)         null,
   code                 varchar(5)           null,
   parent_id            int4                 null,
   description          text                 null,
   constraint pk_commodity_category primary key (id)
);

/*==============================================================*/
/* Table: commodity_source                                      */
/*==============================================================*/
create table commodity_source (
   id                   serial not null,
   name                 varchar(200)         null,
   description          char(1)              null,
   code                 varchar(10)          null,
   constraint pk_commodity_source primary key (id)
);

comment on table commodity_source is
'Loan, Purchase, Return, Custody, Donation, Transfer and other';

/*==============================================================*/
/* Table: commodity_type                                        */
/*==============================================================*/
create table commodity_type (
   id    serial not null,
   name                 varchar(200)         null,
   description          char(200)            null,
   constraint pk_commodity_type primary key (id)
);

comment on table commodity_type is
'Food and Non-food ';

/*==============================================================*/
/* Table: currency                                              */
/*==============================================================*/
create table currency (
   id                   serial not null,
   name                 varchar(20)          not null,
   symbol               varchar(3)           not null,
   constraint pk_currency primary key (id)
);

/*==============================================================*/
/* Table: dispatch                                              */
/*==============================================================*/
create table dispatch (
   id                   serial not null,
   gin                  varchar(100)         not null,
   requisition_no       varchar(100)         not null,
   period_month         int4                 null,
   period_round         int4                 null,
   fdp_id               int4                 null,
   transport_order_id   int4                 null,
   driver               varchar(100)         null,
   plate_no             varchar(100)         null,
   created_date         date                 null,
   dispatched_date      date                 null,
   created_by           int4                 null,
   dispatched_by        int4                 null,
   remark               text                 null,
   last_updated         date                 null,
   constraint pk_dispatch primary key (id)
);

/*==============================================================*/
/* Table: dispatch_allocation                                   */
/*==============================================================*/
create table dispatch_allocation (
   id                   int4                 not null,
   hub_id               int4                 null,
   requisition_no       varchar(10)          not null,
   program_id           int4                 null,
   commodity_id         int4                 null,
   quantity             float8               null,
   unit_of_measure_id   int4                 null,
   ope_id               int4                 null,
   project_id           int4                 not null,
   project_batch_id     int4                 null,
   fdp_id               int4                 null,
   constraint pk_dispatch_allocation primary key (id)
);

/*==============================================================*/
/* Table: dispatch_item                                         */
/*==============================================================*/
create table dispatch_item (
   id                   serial not null,
   commodity_id         int4                 null,
   dispatch_id          int4                 null,
   quantity             float8               not null,
   uom_id               int4                 null,
   project_id           int4                 not null,
   batch_id             int4                 null,
   stock_move_id        int4                 null,
   description          text                 null,
   constraint pk_dispatch_item primary key (id)
);

/*==============================================================*/
/* Table: donor                                                 */
/*==============================================================*/
create table donor (
   id                   serial not null,
   name                 varchar(200)         not null,
   short_name           varchar(10)          not null,
   code                 varchar(10)          not null,
   source_donor         bool                 null,
   responsible_donor    bool                 null,
   constraint pk_donor primary key (id)
);

/*==============================================================*/
/* Table: fdp                                                   */
/*==============================================================*/
create table fdp (
   id                   serial not null,
   location_id          int4                 not null,
   name                 varchar(200)         not null,
   description          text                 null,
   latitude             decimal              null,
   longitude            decimal              null,
   constraint pk_fdp primary key (id)
);

comment on table fdp is
'Distribution points';

/*==============================================================*/
/* Table: fdp_cmpm_receipt                                      */
/*==============================================================*/
create table fdp_cmpm_receipt (
   id                   serial not null,
   fdp_id               int4                 null,
   program_id           int4                 null,
   reporting_month      int4                 null,
   page_no              int4                 null,
   operation_id         int4                 null,
   prepared_by          varchar(200)         null,
   title                varchar(200)         null,
   prepared_by_mobile_no varchar(200)         null,
   date_prepared        date                 null,
   approved_by          varchar(200)         null,
   approved_by_mobile_no varchar(200)         null,
   approved_date        date                 null,
   constraint pk_fdp_cmpm_receipt primary key (id)
);

/*==============================================================*/
/* Table: fdp_cmpm_receipt_line                                 */
/*==============================================================*/
create table fdp_cmpm_receipt_line (
   id                   serial not null,
   fdp_cmpm_receipt_id  int4                 null,
   requistion_no        varchar(200)         not null,
   git_no               varchar(200)         not null,
   commodity_id         int4                 null,
   round                int4                 null,
   year                 varchar(4)           null,
   dispatched_date      date                 null,
   dispatched_amount    decimal              null,
   dispatch_uom_id      int4                 null,
   fdp_receipt_no       varchar(20)          null,
   fdp_received_date    date                 null,
   received_amount      decimal              null,
   receive_uom_id       int4                 null,
   loss_amount          decimal              null,
   loss_uom_id          int4                 null,
   loss_reason_id       int4                 null,
   constraint pk_fdp_cmpm_receipt_line primary key (id)
);

/*==============================================================*/
/* Table: fdp_contact                                           */
/*==============================================================*/
create table fdp_contact (
   id                   serial not null,
   fdp_id               int4                 null,
   full_name            varchar(200)         null,
   mobile               varchar(200)         null,
   email                varchar(200)         null,
   job_position         varchar(200)         null,
   constraint pk_fdp_contact primary key (id)
);

/*==============================================================*/
/* Table: fdp_receipt                                           */
/*==============================================================*/
create table fdp_receipt (
   id                   serial not null,
   grn                  varchar(10)          not null,
   waybill_no           date                 not null,
   waybill              varchar(10)          not null,
   donor_id             int4                 null,
   transported_by       varchar(200)         null,
   received_by          varchar(200)         null,
   invoice_no           varchar(200)         null,
   po_no                varchar(200)         null,
   fdp_id               int4                 not null,
   constraint pk_fdp_receipt primary key (id)
);

/*==============================================================*/
/* Table: fdp_receipt_item                                      */
/*==============================================================*/
create table fdp_receipt_item (
   id                   serial not null,
   fdp_receipt_id       int4                 null,
   commodity_id         int4                 not null,
   batch_id             int4                 null,
   uom_id               int4                 null,
   sent_quantity        decimal              null,
   received_quantity    decimal              null,
   constraint pk_fdp_receipt_item primary key (id)
);

/*==============================================================*/
/* Table: fscd_annual_plan                                      */
/*==============================================================*/
create table fscd_annual_plan (
   id                   serial not null,
   name                 varchar(200)         not null,
   code                 varchar(100)         null,
   year                 varchar(4)           not null,
   duration             int4                 not null,
   status               int4                 null,
   archived             bool                 null,
   constraint pk_fscd_annual_plan primary key (id)
);

/*==============================================================*/
/* Table: fscd_plan_line                                        */
/*==============================================================*/
create table fscd_plan_line (
   id                   serial not null,
   fscd_plan_id         int4                 null,
   beneficiary_no       int4                 null,
   woreda_id            int4                 null,
   starting_month       int4                 null,
   food_ratio           int4                 null,
   cash_ratio           int4                 null,
   contingency          bool                 null,
   constraint pk_fscd_plan_line primary key (id)
);

/*==============================================================*/
/* Table: fund_source                                           */
/*==============================================================*/
create table fund_source (
   id                   serial not null,
   name                 varchar(50)          not null,
   description          text                 null,
   constraint pk_fund_source primary key (id)
);

/*==============================================================*/
/* Table: gift_certificate                                      */
/*==============================================================*/
create table gift_certificate (
   id                   serial not null,
   gift_date            date                 null,
   donor_id             int4                 null,
   reference_no         varchar(200)         not null,
   vessel               varchar(200)         null,
   eta                  date                 null,
   program_id           int4                 null,
   mode_of_transport_id int4                 null,
   port_name            varchar(200)         null,
   status               varchar(5)           null,
   customs_declaration_no varchar(200)         null,
   bill_of_ladding      varchar(200)         null,
   amount               decimal              null,
   estimated_price      decimal              null,
   estimated_tax        decimal              null,
   purchase_year        varchar(4)           null,
   expiray_date         date                 null,
   budget_type          int4                 null,
   account_no           varchar(50)          null,
   constraint pk_gift_certificate primary key (id)
);

/*==============================================================*/
/* Table: gift_certificate_items                                */
/*==============================================================*/
create table gift_certificate_items (
   id                   serial not null,
   gift_certificate_id  int4                 not null,
   commodity_id         int4                 not null,
   fund_source_id       int4                 null,
   unit_of_measure_id   int4                 null,
   currency_id          int4                 null,
   amount               decimal              not null,
   estimated_value      decimal              null,
   estimated_tax        decimal              null,
   fund_source          int4                 null,
   expiration_date      date                 null,
   constraint pk_gift_certificate_items primary key (id)
);

/*==============================================================*/
/* Table: hrd                                                   */
/*==============================================================*/
create table hrd (
   id                   serial not null,
   year                 varchar(4)           null,
   season_id            int4                 null,
   ration_id            int4                 null,
   status               int4                 null,
   ration               int4                 null,
   created_date         date                 null,
   published_date       date                 null,
   month_from           int4                 null,
   month_to             int4                 null,
   duration             int4                 null,
   archived             bool                 null,
   is_current           bool                 null,
   constraint pk_hrd primary key (id)
);

comment on table hrd is
'Represents requirement document for EWR';

/*==============================================================*/
/* Table: hrd_plan_line                                         */
/*==============================================================*/
create table hrd_plan_line (
   id                   serial not null,
   hrd_id               int4                 null,
   location_id          int4                 null,
   duration             int4                 null,
   starting_month       int4                 null,
   beneficary_number    int4                 not null,
   constraint pk_hrd_plan_line primary key (id)
);

comment on table hrd_plan_line is
'Represents a single row in HRD document';

/*==============================================================*/
/* Table: hub                                                   */
/*==============================================================*/
create table hub (
   id                   serial not null,
   name                 varchar(200)         not null,
   description          text                 null,
   location_id          int4                 null,
   constraint pk_hub primary key (id)
);

/*==============================================================*/
/* Table: location                                              */
/*==============================================================*/
create table location (
   id                   serial not null,
   location_type_id     int4                 not null,
   name                 varchar(200)         not null,
   code                 varchar(100)         null,
   parent_location_id   int4                 null,
   constraint pk_location primary key (id)
);

comment on table location is
'Represents administration hierarchy in a country. E.g. Region -> Zone -> Woreda -> Kebele';

/*==============================================================*/
/* Table: location_type                                         */
/*==============================================================*/
create table location_type (
   id                   serial not null,
   name                 varchar(200)         null,
   description          text                 null,
   constraint pk_location_type primary key (id)
);

comment on table location_type is
'Location types which are country specific. E.g. in Ethiopia this includes Region, Zone, Woreda, Kebele';

/*==============================================================*/
/* Table: mode_of_transport                                     */
/*==============================================================*/
create table mode_of_transport (
   id                   serial not null,
   name                 varchar(50)          not null,
   description          text                 null,
   constraint pk_mode_of_transport primary key (id)
);

/*==============================================================*/
/* Table: operation                                             */
/*==============================================================*/
create table operation (
   id                   serial not null,
   program_id           int4                 not null,
   hrd_id               int4                 null,
   fscd_plan_id         int4                 null,
   name                 varchar(200)         not null,
   description          text                 null,
   year                 varchar(4)           not null,
   round                int4                 null,
   operation_month      int4                 null,
   expected_start       date                 null,
   planned_end          date                 null,
   actual_start         date                 null,
   actual_end           date                 null,
   status               varchar(10)          null,
   constraint pk_operation primary key (id)
);

/*==============================================================*/
/* Table: program                                               */
/*==============================================================*/
create table program (
   id                   serial not null,
   name                 varchar(100)         not null,
   short_name           varchar(10)          not null,
   description          text                 null,
   constraint pk_program primary key (id)
);

/*==============================================================*/
/* Table: project_batch                                         */
/*==============================================================*/
create table project_batch (
   id                   serial not null,
   name                 varchar(200)         not null,
   commodity_id         int4                 not null,
   project_id           int4                 null,
   internal_reference   varchar(200)         null,
   owner_id             int4                 null,
   original_identifier  varchar(100)         null,
   quantity             decimal              null,
   unit_of_measure_id   int4                 null,
   constraint pk_project_batch primary key (id)
);

/*==============================================================*/
/* Table: quotation                                             */
/*==============================================================*/
create table quotation (
   id                   serial not null,
   submission_id        int4                 null,
   source_id            int4                 null,
   destination_id       int4                 null,
   tariff_quote         decimal              null,
   remark               text                 null,
   constraint pk_quotation primary key (id)
);

/*==============================================================*/
/* Table: ration                                                */
/*==============================================================*/
create table ration (
   id                   serial not null,
   description          char(1)              null,
   reference_no         varchar(200)         null,
   current_ration       bool                 null,
   created_by           varchar(200)         null,
   created_date         date                 null,
   last_updated         date                 null,
   constraint pk_ration primary key (id)
);

/*==============================================================*/
/* Table: ration_detail                                         */
/*==============================================================*/
create table ration_detail (
   id                   serial not null,
   ration_id            int4                 null,
   unit_of_measure      int4                 null,
   category_id          int4                 null,
   amount               decimal              null,
   constraint pk_ration_detail primary key (id)
);

/*==============================================================*/
/* Table: receipt                                               */
/*==============================================================*/
create table receipt (
   id                   serial not null,
   stock_operation_id   int4                 null,
   grn                  varchar(200)         null,
   receive_date         date                 null,
   hub_id               int4                 null,
   store_location_id    int4                 null,
   delivered_by         varchar(200)         null,
   supplier_id          int4                 null,
   transported_by       varchar(200)         null,
   plate_no             varchar(200)         null,
   plate_no_trailer     varchar(200)         null,
   weight_bridge_ticket_no varchar(200)         null,
   weight_before_unloading decimal              null,
   weight_after_unloading decimal              null,
   storekeeper_name     varchar(200)         null,
   waybill_no           varchar(200)         null,
   purchase_req_no      varchar(200)         null,
   purchase_order_no    varchar(200)         null,
   invoice_no           varchar(200)         null,
   commodity_source_id  int4                 null,
   status               int4                 null,
   constraint pk_receipt primary key (id)
);

/*==============================================================*/
/* Table: receipt_line                                          */
/*==============================================================*/
create table receipt_line (
   id                   serial not null,
   receipt_id           int4                 null,
   commodity_id         int4                 null,
   stock_move_id        int4                 null,
   project_id           int4                 not null,
   batch_id             int4                 null,
   uom_id               int4                 null,
   amount               decimal              null,
   constraint pk_receipt_line primary key (id)
);

/*==============================================================*/
/* Table: region_request                                        */
/*==============================================================*/
create table region_request (
   id                   serial not null,
   region_id            int4                 null,
   month                int4                 null,
   round                int4                 null,
   reference_no         varchar(200)         not null,
   status               int4                 null,
   requested_by         varchar(200)         null,
   approved_by          varchar(200)         null,
   contingency          decimal              null,
   program_id           int4                 null,
   constraint pk_region_request primary key (id)
);

/*==============================================================*/
/* Table: region_request_item                                   */
/*==============================================================*/
create table region_request_item (
   id                   serial not null,
   request_id           int4                 null,
   beneficiary_no       int4                 not null,
   fdp_id               int4                 not null,
   constraint pk_region_request_item primary key (id)
);

/*==============================================================*/
/* Table: requisition                                           */
/*==============================================================*/
create table requisition (
   id                   serial not null,
   requisition_no       varchar(10)          not null,
   commodity_id         int4                 null,
   region               int4                 null,
   zone                 int4                 null,
   operation_id         int4                 null,
   round                int4                 null,
   month                int4                 null,
   requested_by         varchar(200)         null,
   request_date         date                 null,
   ration               int4                 null,
   status               varchar(10)          null,
   constraint pk_requisition primary key (id)
);

/*==============================================================*/
/* Table: requisition_detail                                    */
/*==============================================================*/
create table requisition_detail (
   id                   serial not null,
   beneficiary_no       int4                 not null,
   amount               int4                 not null,
   unit_of_measure_id   int4                 null,
   fdp_id               int4                 null,
   requisition_id       int4                 null,
   contingency          int4                 null,
   commodity_id         int4                 null,
   constraint pk_requisition_detail primary key (id)
);

/*==============================================================*/
/* Table: season                                                */
/*==============================================================*/
create table season (
   id                   serial not null,
   season_name          varchar(200)         not null,
   description          text                 null,
   constraint pk_season primary key (id)
);

/*==============================================================*/
/* Table: stock_location                                        */
/*==============================================================*/
create table stock_location (
   stock_location_id    serial not null,
   stock_location_type_id int4                 null,
   name                 varchar(200)         null,
   complete_name        varchar(200)         null,
   active               bool                 null,
   description          text                 null,
   constraint pk_stock_location primary key (stock_location_id)
);

/*==============================================================*/
/* Table: stock_location_type                                   */
/*==============================================================*/
create table stock_location_type (
   id                   serial not null,
   name                 varchar(200)         not null,
   description          time                 null,
   constraint pk_stock_location_type primary key (id)
);

/*==============================================================*/
/* Table: stock_move                                            */
/*==============================================================*/
create table stock_move (
   id                   serial not null,
   batch_id             int4                 null,
   stock_operation_id   int4                 null,
   hub_id               int4                 null,
   state                int4                 null,
   created_date         date                 null,
   commodity_id         int4                 null,
   uom_id               int4                 null,
   location_id          int4                 null,
   destination_id       int4                 null,
   partner_id           int4                 null,
   constraint pk_stock_move primary key (id)
);

/*==============================================================*/
/* Table: stock_operation                                       */
/*==============================================================*/
create table stock_operation (
   stock_operation_id   serial not null,
   name                 varchar(200)         null,
   description          char(1)              null,
   type                 int4                 null,
   source_location_id   int4                 null,
   destination_location_id int4                 null,
   constraint pk_stock_operation primary key (stock_operation_id)
);

/*==============================================================*/
/* Table: store                                                 */
/*==============================================================*/
create table store (
   id                   serial not null,
   name                 varchar(200)         not null,
   hub_id               int4                 not null,
   store_owner_id       int4                 null,
   store_location_id    int4                 null,
   temporary_store      bool                 null,
   constraint pk_store primary key (id)
);

/*==============================================================*/
/* Table: store_location                                        */
/*==============================================================*/
create table store_location (
   id                   serial not null,
   hub_id               int4                 null,
   location_id          int4                 null,
   name                 varchar(200)         null,
   description          text                 null,
   constraint pk_store_location primary key (id)
);

/*==============================================================*/
/* Table: submission                                            */
/*==============================================================*/
create table submission (
   id                   serial not null,
   bid_id               int4                 null,
   bidbond_amount       decimal              null,
   transporter_id       int4                 null,
   constraint pk_submission primary key (id)
);

/*==============================================================*/
/* Table: transporter                                           */
/*==============================================================*/
create table transporter (
   id                   serial not null,
   name                 varchar(200)         null,
   code                 varchar(20)          null,
   ownership            varchar(10)          null,
   vehicle_count        int4                 null,
   lift_capacity        decimal              null,
   capital              decimal              null,
   employee_count       int4                 null,
   contact_person       varchar(100)         null,
   contact_phone        varchar(100)         null,
   remark               char(1)              null,
   constraint pk_transporter primary key (id)
);

/*==============================================================*/
/* Table: transporter_address                                   */
/*==============================================================*/
create table transporter_address (
   id                   serial not null,
   transporter_id       int4                 null,
   region               int4                 null,
   zone                 int4                 null,
   sub_city             varchar(100)         null,
   woreda               int4                 null,
   kebele               varchar(10)          null,
   hno                  varchar(10)          null,
   phone_no             varchar(100)         null,
   mobile               varchar(100)         null,
   email                varchar(100)         null,
   constraint pk_transporter_address primary key (id)
);

/*==============================================================*/
/* Table: unit_of_measure                                       */
/*==============================================================*/
create table unit_of_measure (
   id                   serial not null,
   uom_category_id      int4                 not null,
   type                 varchar(10)          not null,
   ratio                decimal              not null,
   name                 varchar(200)         not null,
   code                 varchar(4)           null,
   constraint pk_unit_of_measure primary key (id)
);

/*==============================================================*/
/* Table: uom_category                                          */
/*==============================================================*/
create table uom_category (
   id      serial not null,
   name                 varchar(200)         null,
   constraint pk_uom_category primary key (id)
);

comment on table uom_category is
'Unit, weight, volume, length';

/*==============================================================*/
/* Table: woreda_cmpm_stock_distribution                        */
/*==============================================================*/
create table woreda_cmpm_stock_distribution (
   id                   serial not null,
   woreda_id            int4                 null,
   program_id           int4                 null,
   operation_id         int4                 null,
   reporting_month      int4                 null,
   page_no              int4                 null,
   beneficiaries_total  int4                 null,
   beneficiaries_direct_support int4                 null,
   beneficiaries_public_work int4                 null,
   beneficiaries_male   int4                 null,
   beneficiaries_female int4                 null,
   beneficiaries_under_five int4                 null,
   beneficiaries_between_5_18 int4                 null,
   beneficiaries_above_eighteen int4                 null,
   prepared_by          varchar(200)         null,
   prepared_by_title    varchar(200)         null,
   prepared_by_mobile_no varchar(200)         null,
   date_prepared        date                 null,
   approved_by          varchar(200)         null,
   approved_by_mobile_no varchar(200)         null,
   approved_date        date                 null,
   constraint pk_woreda_cmpm_stock_distribut primary key (id)
);

/*==============================================================*/
/* Table: bid_winner                                            */
/*==============================================================*/
create table bid_winner (
   id                   serial not null,
   bid_id               int4                 null,
   transporter_id       int4                 null,
   source_id            int4                 null,
   destination_id       int4                 null,
   tariff_amount        decimal              null,
   constraint pk_bid_winner primary key (id)
);

/*==============================================================*/
/* Table: project                                               */
/*==============================================================*/
create table project (
   id                   serial not null,
   code                 varchar(100)         null,
   reference_no         varchar(100)         not null,
   commodity_id         int4                 null,
   donor_id             int4                 null,
   quantity             decimal              not null,
   expected_quantity    decimal              null,
   unit_of_measure_id   int4                 null,
   created_date         date                 null,
   created_by           varchar(100)         null,
   remark               text                 null,
   status               int4                 null,
   program_id           int4                 null,
   commodity_source_id  int4                 null,
   constraint pk_project primary key (id)
);

/*==============================================================*/
/* Table: project_allocation                                    */
/*==============================================================*/
create table project_allocation (
   id                   int4                 not null,
   hub_id               int4                 null,
   project_id           int4                 null,
   allocated_quantity   decimal              not null,
   unit_of_measure_id   int4                 null,
   constraint pk_project_allocation primary key (id)
);

/*==============================================================*/
/* Table: stock_transaction                                     */
/*==============================================================*/
create table stock_transaction (
   transaction_id       serial not null,
   stock_move_id        int4                 null,
   commodity_id         int4                 null,
   uom_id               int4                 null,
   quantity             decimal              null,
   transaction_date     date                 null,
   stock_location_id    int4                 null,
   batch_id             int4                 null,
   constraint pk_stock_transaction primary key (transaction_id)
);

/*==============================================================*/
/* Table: store_ledger                                          */
/*==============================================================*/
create table store_ledger (
   id                   serial not null,
   hub_id               int4                 null,
   store_id             int4                 null,
   commodity_id         int4                 null,
   operation            varchar(100)         null,
   donor_id             int4                 null,
   constraint pk_store_ledger primary key (id)
);

/*==============================================================*/
/* Table: store_ledger_entry                                    */
/*==============================================================*/
create table store_ledger_entry (
   id                   serial not null,
   store_ledger_id      int4                 null,
   transaction_date     date                 not null,
   driver               varchar(200)         null,
   plate_no             varchar(10)          null,
   trailer_plate_no     varchar(10)          null,
   transporter          varchar(200)         null,
   weight_bridge_ticket_no varchar(100)         null,
   waybill              varchar(100)         null,
   grn                  varchar(100)         null,
   source_id            int4                 null,
   unit_of_measure_id   int4                 null,
   quantity_in_unit     decimal              null,
   quantity_in_quintal  decimal              null,
   quantity_in_bags     int4                 null,
   requisition_no       varchar(100)         null,
   git                  varchar(100)         null,
   region_id            int4                 null,
   zone_id              int4                 null,
   woreda_id            int4                 null,
   fdp_id               int4                 null,
   constraint pk_store_ledger_entry primary key (id)
);

/*==============================================================*/
/* Table: store_owner                                           */
/*==============================================================*/
create table store_owner (
   id                   serial not null,
   name                 varchar(200)         null,
   long_name            char(1)              null,
   description          char(1)              null,
   constraint pk_store_owner primary key (id)
);

/*==============================================================*/
/* Table: transport_contract                                    */
/*==============================================================*/
create table transport_contract (
   id                   serial not null,
   contract_no          varchar(100)         null,
   transporter_id       int4                 null,
   comment              text                 null,
   constraint pk_transport_contract primary key (id)
);

/*==============================================================*/
/* Table: transport_order                                       */
/*==============================================================*/
create table transport_order (
   id                   serial not null,
   transport_order_no   varchar(50)          null,
   transporter_id       int4                 null,
   contract_id          int4                 null,
   bid_id               int4                 null,
   operation_id         int4                 null,
   region_id            int4                 null,
   order_date           date                 null,
   created_date         date                 null,
   start_date           date                 null,
   end_date             date                 null,
   constraint pk_transport_order primary key (id)
);

/*==============================================================*/
/* Table: transport_order_item                                  */
/*==============================================================*/
create table transport_order_item (
   id                   serial not null,
   transport_order_id   int4                 null,
   constraint pk_transport_order_item primary key (id)
);

/*==============================================================*/
/* Table: transport_requisition                                 */
/*==============================================================*/
create table transport_requisition (
   id                   serial not null,
   requisition_no       varchar(100)         null,
   region_id            int4                 null,
   operation_id         int4                 null,
   created_date         date                 null,
   description          text                 null,
   constraint pk_transport_requisition primary key (id)
);

/*==============================================================*/
/* Table: transport_requisition_item                            */
/*==============================================================*/
create table transport_requisition_item (
   id                   int4                 not null,
   transport_requisition_id int4                 null,
   requisition_no       varchar(100)         null,
   fdp_id               int4                 null,
   commodity_id         int4                 null,
   quantity             decimal              null,
   has_transport_order  bool                 not null,
   constraint pk_transport_requisition_item primary key (id)
);

/*==============================================================*/
/* Table: woreda_stock_distribution_line                        */
/*==============================================================*/
create table woreda_stock_distribution_line (
   id                   serial not null,
   distribution_id      int4                 null,
   fdp_id               int4                 null,
   commodity_id         int4                 null,
   requisition_no       varchar(20)          not null,
   starting_balance_amount decimal              null,
   starting_balance_uom_id int4                 null,
   received_amount      decimal              null,
   received_amount_uom_id int4                 null,
   dispatched_amount    decimal              null,
   dispatched_amount_uom_id int4                 null,
   closing_balance      decimal              null,
   closing_balance_uom_id int4                 null,
   distribution_start_date date                 null,
   distribution_end_date date                 null,
   distributed_amount   decimal              null,
   distributed_amount_uom_id int4                 null,
   loss_amount          decimal              null,
   loss_amount_uom_id   int4                 null,
   loss_reason_id       int4                 null,
   constraint pk_woreda_stock_distribution_l primary key (id)
);

alter table bid
   add constraint fk_bid_reference_bid_plan foreign key (plan_id)
      references bid_plan (id);

alter table bid
   add constraint fk_bid_reference_location foreign key (region_id)
      references location (id);

alter table bid_plan_line_item
   add constraint fk_bid_plan_reference_bid_plan foreign key (plan_id)
      references bid_plan (id);

alter table bid_plan_line_item
   add constraint fk_bid_plan_reference_location foreign key (destination_)
      references location (id);

alter table commodity
   add constraint fk_commodit_reference_unit_of_ foreign key (unit_of_measure_id)
      references unit_of_measure (id);

alter table commodity
   add constraint fk_commodit_ref_comca_commodit foreign key (category_id)
      references commodity_category (id);

alter table commodity
   add constraint fk_commodit_ref_commo_commodit foreign key (commodity_type_id)
      references commodity_type (id);

alter table commodity_category
   add constraint fk_commodit_ref_self__commodit foreign key (parent_id)
      references commodity_category (id);

alter table dispatch
   add constraint fk_dispatch_reference_fdp foreign key (fdp_id)
      references fdp (id);

alter table dispatch_allocation
   add constraint fk_dispatch_reference_program foreign key (program_id)
      references program (id)
      on delete restrict on update restrict;

alter table dispatch_allocation
   add constraint fk_dispatch_reference_commodit foreign key (commodity_id)
      references commodity (id)
      on delete restrict on update restrict;

alter table dispatch_allocation
   add constraint fk_dispatch_reference_unit_of_ foreign key (unit_of_measure_id)
      references unit_of_measure (id)
      on delete restrict on update restrict;

alter table dispatch_allocation
   add constraint fk_dispatch_reference_operatio foreign key (ope_id)
      references operation (id)
      on delete restrict on update restrict;

alter table dispatch_allocation
   add constraint fk_dispatch_reference_project foreign key (project_id)
      references project (id)
      on delete restrict on update restrict;

alter table dispatch_allocation
   add constraint fk_dispatch_reference_project_ foreign key (project_batch_id)
      references project_batch (id)
      on delete restrict on update restrict;

alter table dispatch_item
   add constraint fk_dispatch_reference_dispatch foreign key (dispatch_id)
      references dispatch (id);

alter table dispatch_item
   add constraint fk_dispatch_reference_unit_of_ foreign key (uom_id)
      references unit_of_measure (id);

alter table dispatch_item
   add constraint fk_dispatch_reference_project_ foreign key (batch_id)
      references project_batch (id);

alter table dispatch_item
   add constraint fk_dispatch_reference_stock_mo foreign key (stock_move_id)
      references stock_move (id);

alter table dispatch_item
   add constraint fk_dispatch_reference_project foreign key (project_id)
      references project (id)
      on delete restrict on update restrict;

alter table fdp
   add constraint fk_fdp_reference_location foreign key (location_id)
      references location (id);

alter table fdp_cmpm_receipt
   add constraint fk_fdp_cmpm_reference_operatio foreign key (operation_id)
      references operation (id);

alter table fdp_cmpm_receipt_line
   add constraint fk_fdp_cmpm_reference_fdp_cmpm foreign key (fdp_cmpm_receipt_id)
      references fdp_cmpm_receipt (id);

alter table fdp_contact
   add constraint fk_fdp_cont_reference_fdp foreign key (fdp_id)
      references fdp (id);

alter table fdp_receipt
   add constraint fk_fdp_rece_reference_fdp foreign key (fdp_id)
      references fdp (id);

alter table fdp_receipt_item
   add constraint fk_fdp_rece_reference_fdp_rece foreign key (fdp_receipt_id)
      references fdp_receipt (id);

alter table fscd_plan_line
   add constraint fk_fscd_pla_reference_fscd_ann foreign key (fscd_plan_id)
      references fscd_annual_plan (id);

alter table fscd_plan_line
   add constraint fk_fscd_pla_reference_location foreign key (woreda_id)
      references location (id);

alter table gift_certificate
   add constraint fk_gift_cer_reference_donor foreign key (donor_id)
      references donor (id);

alter table gift_certificate
   add constraint fk_gift_cer_reference_program foreign key (program_id)
      references program (id);

alter table gift_certificate
   add constraint fk_gift_cer_reference_mode_of_ foreign key (mode_of_transport_id)
      references mode_of_transport (id);

alter table gift_certificate
   add constraint fk_gift_cer_reference_budget_t foreign key (budget_type)
      references budget_type (id);

alter table gift_certificate_items
   add constraint fk_gift_cer_reference_gift_cer foreign key (gift_certificate_id)
      references gift_certificate (id);

alter table gift_certificate_items
   add constraint fk_gift_cer_reference_commodit foreign key (commodity_id)
      references commodity (id);

alter table gift_certificate_items
   add constraint fk_gift_cer_reference_fund_sou foreign key (fund_source_id)
      references fund_source (id);

alter table gift_certificate_items
   add constraint fk_gift_cer_reference_unit_of_ foreign key (unit_of_measure_id)
      references unit_of_measure (id);

alter table gift_certificate_items
   add constraint fk_gift_cer_reference_currency foreign key (currency_id)
      references currency (id);

alter table hrd
   add constraint fk_hrd_reference_season foreign key (season_id)
      references season (id);

alter table hrd
   add constraint fk_hrd_reference_ration foreign key (ration_id)
      references ration (id);

alter table hrd_plan_line
   add constraint fk_hrd_plan_reference_hrd foreign key (hrd_id)
      references hrd (id);

alter table hrd_plan_line
   add constraint fk_hrd_plan_reference_location foreign key (location_id)
      references location (id);

alter table hub
   add constraint fk_hub_reference_location foreign key (location_id)
      references location (id);

alter table location
   add constraint fk_location_reference_location foreign key (location_type_id)
      references location_type (id);

alter table operation
   add constraint fk_operatio_reference_hrd foreign key (hrd_id)
      references hrd (id);

alter table operation
   add constraint fk_operatio_reference_program foreign key (program_id)
      references program (id);

alter table operation
   add constraint fk_operatio_reference_fscd_ann foreign key (fscd_plan_id)
      references fscd_annual_plan (id);

alter table project_batch
   add constraint fk_project__reference_commodit foreign key (commodity_id)
      references commodity (id);

alter table project_batch
   add constraint fk_project__reference_project foreign key (project_id)
      references project (id)
      on delete restrict on update restrict;

alter table quotation
   add constraint fk_quotatio_reference_submissi foreign key (submission_id)
      references submission (id);

alter table ration_detail
   add constraint fk_ration_d_reference_ration foreign key (ration_id)
      references ration (id);

alter table ration_detail
   add constraint fk_ration_d_reference_unit_of_ foreign key (unit_of_measure)
      references unit_of_measure (id);

alter table ration_detail
   add constraint fk_ration_d_reference_commodit foreign key (category_id)
      references commodity_category (id);

alter table receipt
   add constraint fk_receipt_reference_stock_op foreign key (stock_operation_id)
      references stock_operation (stock_operation_id);

alter table receipt_line
   add constraint fk_receipt__reference_project_ foreign key (batch_id)
      references project_batch (id);

alter table receipt_line
   add constraint fk_receipt__reference_stock_mo foreign key (stock_move_id)
      references stock_move (id);

alter table receipt_line
   add constraint fk_receipt__reference_project foreign key (project_id)
      references project (id)
      on delete restrict on update restrict;

alter table receipt_line
   add constraint fk_receipt__ref_recip_receipt foreign key (receipt_id)
      references receipt (id);

alter table region_request
   add constraint fk_region_r_reference_program foreign key (program_id)
      references program (id);

alter table region_request_item
   add constraint fk_region_r_reference_fdp foreign key (fdp_id)
      references fdp (id);

alter table region_request_item
   add constraint fk_region_r_reference_region_r foreign key (request_id)
      references region_request (id);

alter table requisition
   add constraint fk_requisit_reference_commodit foreign key (commodity_id)
      references commodity (id);

alter table requisition
   add constraint fk_requisit_reference_operatio foreign key (operation_id)
      references operation (id);

alter table requisition
   add constraint fk_requisit_reference_ration foreign key (ration)
      references ration (id);

alter table requisition
   add constraint fk_requisit_ref_req_l_location foreign key (region)
      references location (id);

alter table requisition
   add constraint fk_requisit_ref_requi_location foreign key (zone)
      references location (id);

alter table requisition_detail
   add constraint fk_requisit_reference_fdp foreign key (fdp_id)
      references fdp (id);

alter table requisition_detail
   add constraint fk_requisit_reference_requisit foreign key (requisition_id)
      references requisition (id);

alter table stock_location
   add constraint fk_stock_lo_reference_stock_lo foreign key (stock_location_type_id)
      references stock_location_type (id);

alter table stock_move
   add constraint fk_stock_mo_reference_commodit foreign key (commodity_id)
      references commodity (id);

alter table stock_move
   add constraint fk_stock_mo_reference_stock_op foreign key (stock_operation_id)
      references stock_operation (stock_operation_id);

alter table stock_move
   add constraint fk_stock_mo_ref_stkmv_project_ foreign key (batch_id)
      references project_batch (id);

alter table stock_operation
   add constraint fk_stock_op_ref_stk_o_stock_lo foreign key (source_location_id)
      references stock_location (stock_location_id);

alter table stock_operation
   add constraint fk_stock_op_ref_stkop_stock_lo foreign key (destination_location_id)
      references stock_location (stock_location_id);

alter table store
   add constraint fk_store_reference_hub foreign key (hub_id)
      references hub (id);

alter table store
   add constraint fk_store_reference_store_ow foreign key (store_owner_id)
      references store_owner (id);

alter table store
   add constraint fk_store_reference_store_lo foreign key (store_location_id)
      references store_location (id);

alter table store_location
   add constraint fk_store_lo_reference_hub foreign key (hub_id)
      references hub (id);

alter table store_location
   add constraint fk_store_lo_reference_location foreign key (location_id)
      references location (id);

alter table submission
   add constraint fk_submissi_reference_bid foreign key (bid_id)
      references bid (id);

alter table submission
   add constraint fk_submissi_reference_transpor foreign key (transporter_id)
      references transporter (id);

alter table transporter_address
   add constraint fk_transpor_reference_transpor foreign key (transporter_id)
      references transporter (id);

alter table unit_of_measure
   add constraint fk_unit_of__reference_uom_cate foreign key (uom_category_id)
      references uom_category (id);

alter table bid_winner
   add constraint fk_bid_winn_reference_bid foreign key (bid_id)
      references bid (id)
      on delete restrict on update restrict;

alter table bid_winner
   add constraint fk_bid_winn_reference_transpor foreign key (transporter_id)
      references transporter (id)
      on delete restrict on update restrict;

alter table project
   add constraint fk_project_reference_commodit foreign key (commodity_source_id)
      references commodity_source (id)
      on delete restrict on update restrict;

alter table project_allocation
   add constraint fk_project__reference_project foreign key (project_id)
      references project (id)
      on delete restrict on update restrict;

alter table stock_transaction
   add constraint fk_stock_tr_reference_stock_mo foreign key (stock_move_id)
      references stock_move (id);

alter table stock_transaction
   add constraint fk_stock_tr_reference_stock_lo foreign key (stock_location_id)
      references stock_location (stock_location_id);

alter table stock_transaction
   add constraint fk_stock_tr_reference_commodit foreign key (commodity_id)
      references commodity (id);

alter table stock_transaction
   add constraint fk_stock_tr_ref_batch_project_ foreign key (batch_id)
      references project_batch (id);

alter table store_ledger
   add constraint fk_store_le_reference_donor foreign key (donor_id)
      references donor (id)
      on delete restrict on update restrict;

alter table store_ledger
   add constraint fk_store_le_reference_commodit foreign key (commodity_id)
      references commodity (id)
      on delete restrict on update restrict;

alter table store_ledger
   add constraint fk_store_le_reference_hub foreign key (hub_id)
      references hub (id)
      on delete restrict on update restrict;

alter table store_ledger
   add constraint fk_store_le_reference_store foreign key (store_id)
      references store (id)
      on delete restrict on update restrict;

alter table store_ledger_entry
   add constraint fk_store_le_reference_fdp foreign key (fdp_id)
      references fdp (id)
      on delete restrict on update restrict;

alter table store_ledger_entry
   add constraint fk_store_le_reference_unit_of_ foreign key (unit_of_measure_id)
      references unit_of_measure (id)
      on delete restrict on update restrict;

alter table store_ledger_entry
   add constraint fk_store_le_reference_store_le foreign key (store_ledger_id)
      references store_ledger (id)
      on delete restrict on update restrict;

alter table store_ledger_entry
   add constraint fk_store_le_ref_ledge_location foreign key (zone_id)
      references location (id)
      on delete restrict on update restrict;

alter table store_ledger_entry
   add constraint fk_store_le_ref_loc_s_location foreign key (woreda_id)
      references location (id)
      on delete restrict on update restrict;

alter table store_ledger_entry
   add constraint fk_store_le_ref_store_location foreign key (region_id)
      references location (id)
      on delete restrict on update restrict;

alter table transport_contract
   add constraint fk_transpor_reference_transpor foreign key (transporter_id)
      references transporter (id)
      on delete restrict on update restrict;

alter table transport_order
   add constraint fk_transpor_reference_operatio foreign key (operation_id)
      references operation (id)
      on delete restrict on update restrict;

alter table transport_order
   add constraint fk_transpor_reference_transpor foreign key (transporter_id)
      references transporter (id)
      on delete restrict on update restrict;

alter table transport_requisition
   add constraint fk_transpor_reference_location foreign key (region_id)
      references location (id)
      on delete restrict on update restrict;

alter table transport_requisition
   add constraint fk_transpor_reference_operatio foreign key (operation_id)
      references operation (id)
      on delete restrict on update restrict;

alter table transport_requisition_item
   add constraint fk_transpor_reference_transpor foreign key (transport_requisition_id)
      references transport_requisition (id)
      on delete restrict on update restrict;

alter table transport_requisition_item
   add constraint fk_transpor_reference_fdp foreign key (fdp_id)
      references fdp (id)
      on delete restrict on update restrict;

alter table transport_requisition_item
   add constraint fk_transpor_reference_commodit foreign key (commodity_id)
      references commodity (id)
      on delete restrict on update restrict;

alter table woreda_stock_distribution_line
   add constraint fk_woreda_s_reference_woreda_c foreign key (distribution_id)
      references woreda_cmpm_stock_distribution (id);


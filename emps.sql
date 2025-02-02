PGDMP  9    (                |            emps    16.3    16.3 %               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16485    emps    DATABASE     w   CREATE DATABASE emps WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_India.1252';
    DROP DATABASE emps;
                postgres    false            �            1259    16550    finance_details    TABLE     8  CREATE TABLE public.finance_details (
    employee_id integer,
    user_id integer,
    pancard character(10) NOT NULL,
    aadharcard character(12) NOT NULL,
    bank_name character varying(255) NOT NULL,
    branch character varying(255) NOT NULL,
    ifsc_code character(11) NOT NULL,
    ctc_breakup text
);
 #   DROP TABLE public.finance_details;
       public         heap    postgres    false            �            1259    16501    personal_details    TABLE     #  CREATE TABLE public.personal_details (
    employee_id integer NOT NULL,
    user_id integer,
    full_name character varying(255) NOT NULL,
    date_of_birth date NOT NULL,
    gender character varying(50) NOT NULL,
    age integer,
    current_address character varying(255) NOT NULL,
    permanent_address character varying(255) NOT NULL,
    mobile character(10) NOT NULL,
    personal_mail character varying(255) NOT NULL,
    emergency_contact_name character varying(255) NOT NULL,
    emergency_contact_mobile character(10) NOT NULL,
    CONSTRAINT personal_details_age_check CHECK (((age >= 0) AND (age <= 999))),
    CONSTRAINT personal_details_gender_check CHECK (((gender)::text = ANY ((ARRAY['Male'::character varying, 'Female'::character varying, 'Other'::character varying])::text[])))
);
 $   DROP TABLE public.personal_details;
       public         heap    postgres    false            �            1259    16500     personal_details_employee_id_seq    SEQUENCE     �   CREATE SEQUENCE public.personal_details_employee_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.personal_details_employee_id_seq;
       public          postgres    false    218                       0    0     personal_details_employee_id_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.personal_details_employee_id_seq OWNED BY public.personal_details.employee_id;
          public          postgres    false    217            �            1259    16518    professional_details    TABLE     �  CREATE TABLE public.professional_details (
    employee_id integer,
    user_id integer,
    company_mail character varying(255) NOT NULL,
    office_phone character(12),
    city character varying(255) NOT NULL,
    office_address character varying(255) NOT NULL,
    reporting_manager character varying(255),
    hr_name character varying(255),
    employment_history text,
    date_of_joining date NOT NULL
);
 (   DROP TABLE public.professional_details;
       public         heap    postgres    false            �            1259    16535    project_details    TABLE       CREATE TABLE public.project_details (
    employee_id integer,
    user_id integer,
    project_code character varying(50) NOT NULL,
    start_date date NOT NULL,
    end_date date,
    client_name character varying(255),
    reporting_manager character varying(255)
);
 #   DROP TABLE public.project_details;
       public         heap    postgres    false            �            1259    16487    users    TABLE       CREATE TABLE public.users (
    user_id integer NOT NULL,
    employee_code character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    is_admin boolean DEFAULT false NOT NULL
);
    DROP TABLE public.users;
       public         heap    postgres    false            �            1259    16486    users_user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.users_user_id_seq;
       public          postgres    false    216                       0    0    users_user_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;
          public          postgres    false    215            c           2604    16504    personal_details employee_id    DEFAULT     �   ALTER TABLE ONLY public.personal_details ALTER COLUMN employee_id SET DEFAULT nextval('public.personal_details_employee_id_seq'::regclass);
 K   ALTER TABLE public.personal_details ALTER COLUMN employee_id DROP DEFAULT;
       public          postgres    false    218    217    218            a           2604    16490    users user_id    DEFAULT     n   ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);
 <   ALTER TABLE public.users ALTER COLUMN user_id DROP DEFAULT;
       public          postgres    false    216    215    216                      0    16550    finance_details 
   TABLE DATA              COPY public.finance_details (employee_id, user_id, pancard, aadharcard, bank_name, branch, ifsc_code, ctc_breakup) FROM stdin;
    public          postgres    false    221   �5                 0    16501    personal_details 
   TABLE DATA           �   COPY public.personal_details (employee_id, user_id, full_name, date_of_birth, gender, age, current_address, permanent_address, mobile, personal_mail, emergency_contact_name, emergency_contact_mobile) FROM stdin;
    public          postgres    false    218   �6                 0    16518    professional_details 
   TABLE DATA           �   COPY public.professional_details (employee_id, user_id, company_mail, office_phone, city, office_address, reporting_manager, hr_name, employment_history, date_of_joining) FROM stdin;
    public          postgres    false    219   �7                 0    16535    project_details 
   TABLE DATA           �   COPY public.project_details (employee_id, user_id, project_code, start_date, end_date, client_name, reporting_manager) FROM stdin;
    public          postgres    false    220   H9                 0    16487    users 
   TABLE DATA           X   COPY public.users (user_id, employee_code, name, email, password, is_admin) FROM stdin;
    public          postgres    false    216   �9                  0    0     personal_details_employee_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.personal_details_employee_id_seq', 14, true);
          public          postgres    false    217                       0    0    users_user_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.users_user_id_seq', 33, true);
          public          postgres    false    215            s           2606    16558 .   finance_details finance_details_aadharcard_key 
   CONSTRAINT     o   ALTER TABLE ONLY public.finance_details
    ADD CONSTRAINT finance_details_aadharcard_key UNIQUE (aadharcard);
 X   ALTER TABLE ONLY public.finance_details DROP CONSTRAINT finance_details_aadharcard_key;
       public            postgres    false    221            u           2606    16556 +   finance_details finance_details_pancard_key 
   CONSTRAINT     i   ALTER TABLE ONLY public.finance_details
    ADD CONSTRAINT finance_details_pancard_key UNIQUE (pancard);
 U   ALTER TABLE ONLY public.finance_details DROP CONSTRAINT finance_details_pancard_key;
       public            postgres    false    221            m           2606    16512 3   personal_details personal_details_personal_mail_key 
   CONSTRAINT     w   ALTER TABLE ONLY public.personal_details
    ADD CONSTRAINT personal_details_personal_mail_key UNIQUE (personal_mail);
 ]   ALTER TABLE ONLY public.personal_details DROP CONSTRAINT personal_details_personal_mail_key;
       public            postgres    false    218            o           2606    16510 &   personal_details personal_details_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY public.personal_details
    ADD CONSTRAINT personal_details_pkey PRIMARY KEY (employee_id);
 P   ALTER TABLE ONLY public.personal_details DROP CONSTRAINT personal_details_pkey;
       public            postgres    false    218            q           2606    16524 :   professional_details professional_details_company_mail_key 
   CONSTRAINT     }   ALTER TABLE ONLY public.professional_details
    ADD CONSTRAINT professional_details_company_mail_key UNIQUE (company_mail);
 d   ALTER TABLE ONLY public.professional_details DROP CONSTRAINT professional_details_company_mail_key;
       public            postgres    false    219            g           2606    16499    users users_email_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);
 ?   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key;
       public            postgres    false    216            i           2606    16497    users users_employee_code_key 
   CONSTRAINT     a   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_employee_code_key UNIQUE (employee_code);
 G   ALTER TABLE ONLY public.users DROP CONSTRAINT users_employee_code_key;
       public            postgres    false    216            k           2606    16495    users users_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    216            {           2606    16559 0   finance_details finance_details_employee_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.finance_details
    ADD CONSTRAINT finance_details_employee_id_fkey FOREIGN KEY (employee_id) REFERENCES public.personal_details(employee_id) ON DELETE CASCADE;
 Z   ALTER TABLE ONLY public.finance_details DROP CONSTRAINT finance_details_employee_id_fkey;
       public          postgres    false    221    4719    218            |           2606    16564 ,   finance_details finance_details_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.finance_details
    ADD CONSTRAINT finance_details_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON DELETE CASCADE;
 V   ALTER TABLE ONLY public.finance_details DROP CONSTRAINT finance_details_user_id_fkey;
       public          postgres    false    221    4715    216            v           2606    16513 .   personal_details personal_details_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.personal_details
    ADD CONSTRAINT personal_details_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON DELETE CASCADE;
 X   ALTER TABLE ONLY public.personal_details DROP CONSTRAINT personal_details_user_id_fkey;
       public          postgres    false    218    216    4715            w           2606    16525 :   professional_details professional_details_employee_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.professional_details
    ADD CONSTRAINT professional_details_employee_id_fkey FOREIGN KEY (employee_id) REFERENCES public.personal_details(employee_id) ON DELETE CASCADE;
 d   ALTER TABLE ONLY public.professional_details DROP CONSTRAINT professional_details_employee_id_fkey;
       public          postgres    false    4719    219    218            x           2606    16530 6   professional_details professional_details_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.professional_details
    ADD CONSTRAINT professional_details_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON DELETE CASCADE;
 `   ALTER TABLE ONLY public.professional_details DROP CONSTRAINT professional_details_user_id_fkey;
       public          postgres    false    219    4715    216            y           2606    16540 0   project_details project_details_employee_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.project_details
    ADD CONSTRAINT project_details_employee_id_fkey FOREIGN KEY (employee_id) REFERENCES public.personal_details(employee_id) ON DELETE CASCADE;
 Z   ALTER TABLE ONLY public.project_details DROP CONSTRAINT project_details_employee_id_fkey;
       public          postgres    false    220    4719    218            z           2606    16545 ,   project_details project_details_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.project_details
    ADD CONSTRAINT project_details_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON DELETE CASCADE;
 V   ALTER TABLE ONLY public.project_details DROP CONSTRAINT project_details_user_id_fkey;
       public          postgres    false    216    220    4715               �   x���=n�@�z�s�vgR���o�����m|�,�F�(��b���U;!��UrA(
��hE���S���x1����<+� BD�d���^���È�_d�8Di��x6�W��O���ش��?���p��C��j�����ͫ[�Zk2:T�����lG�Ɠ-����{{��]{mAT�])Re�%Ih�Z9z���������?��,$�Q9������B���ǹ�%`�c�x�~&         3  x����N�0E�����+v�+�$6lF�U��I����=vhQZ$j�d_kt�<8px������=�d��po=66�����޵�%���,��U�����}��E�yXy;�m[���kVXLFQ��aD�ŝ��"�zF��t��Z�\��'zY@�ܮ���F�S"A��u��:�bV@쏾u�����P�l�dq����1Jj�@�MCK�<c<���p��1��/Tɸʵ��'��ڣk&�i�>=c�
��Y���E�cn�#~b�ɭHv����awn��ẻ#��}A����         9  x����N�0Eד����+�]B��"!!6݌�i�đJ���I��	���ϙ�vF:�����*�B�gF�f9cpS��c�v�@+ɖ���ي`�������۳�F�'Zpn����P�����+
j{�pP=vӌe�g��w��MD5��w�^,^�Q�z
oοS���c�z�T�QA�\.Ө���v���Tڄ��R��)�7v���\\�Ā���vՏ�����dE�����6��q찅v�״��#�ﱣ� �����Rq�i@k�sE�_�[����gE�����M��B	�2ٮ�$�"���         y   x����4�000�4202�50�2c�8�s2S�J9Sr3�B�S����� �FP�f�@&B��ZN�Rc�Rc]c]#(�Ąjq�j)i14�4�oU	v�i	��䊬)F��� �.�         w   x�3�t500�I�J�,���9�z���������E)�F�&�%\F �F�.�e���) E5H�)g�1H�1g@bYb^&��U�	H�gqb&;��&f栚6��u�jb���� �+8h     
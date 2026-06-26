DATASETS = ["SAMD00000345-Mesorhizobium_sp", "SAMD00000550-Corynebacterium_glutamicum", "SAMD00000344-Mesorhizobium_sp", "SAMD00000355-Mesorhizobium_sp", "SAMD00000552-Corynebacterium_glutamicum"]
COMBINATIONS = ["SAMD00000344-Mesorhizobium_sp:SAMD00000345-Mesorhizobium_sp", "SAMD00000344-Mesorhizobium_sp:SAMD00000355-Mesorhizobium_sp", "SAMD00000344-Mesorhizobium_sp:SAMD00000550-Corynebacterium_glutamicum", "SAMD00000344-Mesorhizobium_sp:SAMD00000552-Corynebacterium_glutamicum", "SAMD00000345-Mesorhizobium_sp:SAMD00000355-Mesorhizobium_sp", "SAMD00000345-Mesorhizobium_sp:SAMD00000550-Corynebacterium_glutamicum", "SAMD00000345-Mesorhizobium_sp:SAMD00000552-Corynebacterium_glutamicum", "SAMD00000355-Mesorhizobium_sp:SAMD00000550-Corynebacterium_glutamicum", "SAMD00000355-Mesorhizobium_sp:SAMD00000552-Corynebacterium_glutamicum", "SAMD00000550-Corynebacterium_glutamicum:SAMD00000552-Corynebacterium_glutamicum"]


rule all:
    input:
        expand("arrows/{dataset}.arrow", dataset = DATASETS),
        expand("parsed_genomes/{dataset}_k31.fa", dataset = DATASETS),
        expand("eulertigs/{dataset}_k31_e.fa", dataset = DATASETS),
        expand("indexes/sbwt_rc/{dataset}.sbwt", dataset = DATASETS), #1st index
        expand("indexes/sbwt_rc/{dataset}.lcs", dataset = DATASETS),
        expand("indexes/sbwt_norc/{dataset}.sbwt", dataset = DATASETS),
        expand("indexes/sbwt_norc/{dataset}.lcs", dataset = DATASETS),
        expand("kmc/{dataset}_k25_can.kmc_pre", dataset = DATASETS),
        expand("kmc/{dataset}_k25_noncan.kmc_pre", dataset = DATASETS),
        expand("indexes/bqf_can/{dataset}.bqf", dataset = DATASETS),
        expand("indexes/bqf_noncan/{dataset}.bqf", dataset = DATASETS),
        expand("indexes/sshash_can/{dataset}.sshash", dataset = DATASETS),
        expand("indexes/sshash_noncan/{dataset}.sshash", dataset = DATASETS),
        expand("indexes/sbb/{dataset}.bf.zst", dataset = DATASETS),
        expand("indexes/fmsi/{dataset}.msfa", dataset = DATASETS),
        expand("indexes/fmsi/{dataset}.msfa.fmsi.ac", dataset = DATASETS),
        #expand("indexes/fmsi_dist/{dataset}.msfa", dataset = DATASETS),
        #expand("indexes/fmsi_dist/{dataset}.msfa.fmsi.ac", dataset = DATASETS),
        expand("indexes/cbl/{dataset}.cbl", dataset = DATASETS),
        expand("indexes/fuze/{dataset}.mp", dataset = DATASETS),
        expand("indexes/swiss/{dataset}.mp", dataset = DATASETS),
        expand("indexes/kmindex/{dataset}_fof.txt", dataset = DATASETS),
        expand("indexes/sklib/{dataset}.sk", dataset = DATASETS),
        expand("indexes/kmc_can/{dataset}_k31.kmc_pre", dataset = DATASETS),
        expand("indexes/kmc_noncan/{dataset}_k31.kmc_pre", dataset = DATASETS),
        expand("queries/{dataset}_pos.fa", dataset = DATASETS), #sets of queries
        expand("queries/{dataset}_neg.fa", dataset = DATASETS),
        expand("queries/streaming/{dataset}_pos.fa", dataset = DATASETS),
        expand("queries/streaming/{dataset}_neg.fa", dataset = DATASETS),
        expand("results/1/sbwt_rc/{dataset}_pos.txt", dataset = DATASETS), #single queries
        expand("results/1/sbwt_rc/{dataset}_neg.txt", dataset = DATASETS),
        expand("results/1/sbwt_norc/{dataset}_pos.txt", dataset = DATASETS),
        expand("results/1/sbwt_norc/{dataset}_neg.txt", dataset = DATASETS),
        expand("results/1/bqf_can/{dataset}_pos.txt", dataset = DATASETS),
        expand("results/1/bqf_can/{dataset}_neg.txt", dataset = DATASETS),
        expand("results/1/bqf_noncan/{dataset}_pos.txt", dataset = DATASETS),
        expand("results/1/bqf_noncan/{dataset}_neg.txt", dataset = DATASETS),
        expand("results/1/sshash_can/{dataset}_pos.txt", dataset = DATASETS),
        expand("results/1/sshash_can/{dataset}_neg.txt", dataset = DATASETS),
        expand("results/1/sshash_noncan/{dataset}_pos.txt", dataset = DATASETS),
        expand("results/1/sshash_noncan/{dataset}_neg.txt", dataset = DATASETS),
        expand("results/1/sbb/{dataset}_pos.txt", dataset = DATASETS),
        expand("results/1/sbb/{dataset}_neg.txt", dataset = DATASETS),
        #expand("results/1/fmsi_same/{dataset}_pos.txt", dataset = DATASETS),
        #expand("results/1/fmsi_same/{dataset}_neg.txt", dataset = DATASETS),
        #expand("results/1/fmsi_dist/{dataset}_pos.txt", dataset = DATASETS),
        #expand("results/1/fmsi_dist/{dataset}_neg.txt", dataset = DATASETS),
        expand("results/1/cbl/{dataset}_pos.txt", dataset = DATASETS),
        expand("results/1/cbl/{dataset}_neg.txt", dataset = DATASETS),
        expand("results/1/swiss/{dataset}_pos.txt", dataset = DATASETS),
        expand("results/1/swiss/{dataset}_neg.txt", dataset = DATASETS),
        expand("results/1/kmindex/{dataset}_pos.txt", dataset = DATASETS),
        expand("results/1/kmindex/{dataset}_neg.txt", dataset = DATASETS),
        expand("results/1/fuze/{dataset}_pos.txt", dataset = DATASETS),
        expand("results/1/fuze/{dataset}_neg.txt", dataset = DATASETS),
        expand("results/1/sklib/{dataset}_pos.txt", dataset = DATASETS),
        expand("results/1/sklib/{dataset}_neg.txt", dataset = DATASETS),
        expand("results/str/sbwt_rc/{dataset}_pos.txt", dataset = DATASETS), #streaming queries
        expand("results/str/sbwt_rc/{dataset}_neg.txt", dataset = DATASETS),
        expand("results/str/sbwt_norc/{dataset}_pos.txt", dataset = DATASETS),
        expand("results/str/sbwt_norc/{dataset}_neg.txt", dataset = DATASETS),
        expand("results/str/bqf_can/{dataset}_pos.txt", dataset = DATASETS),
        expand("results/str/bqf_can/{dataset}_neg.txt", dataset = DATASETS),
        expand("results/str/bqf_noncan/{dataset}_pos.txt", dataset = DATASETS),
        expand("results/str/bqf_noncan/{dataset}_neg.txt", dataset = DATASETS),
        expand("results/str/sshash_can/{dataset}_pos.txt", dataset = DATASETS),
        expand("results/str/sshash_can/{dataset}_neg.txt", dataset = DATASETS),
        expand("results/str/sshash_noncan/{dataset}_pos.txt", dataset = DATASETS),
        expand("results/str/sshash_noncan/{dataset}_neg.txt", dataset = DATASETS),
        expand("results/str/sbb/{dataset}_pos.txt", dataset = DATASETS),
        expand("results/str/sbb/{dataset}_neg.txt", dataset = DATASETS),
        #expand("results/str/fmsi_same/{dataset}_pos.txt", dataset = DATASETS),
        #expand("results/str/fmsi_same/{dataset}_neg.txt", dataset = DATASETS),
        #expand("results/str/fmsi_dist/{dataset}_pos.txt", dataset = DATASETS),
        #expand("results/str/fmsi_dist/{dataset}_neg.txt", dataset = DATASETS),
        expand("results/str/cbl/{dataset}_pos.txt", dataset = DATASETS),
        expand("results/str/cbl/{dataset}_neg.txt", dataset = DATASETS),
        expand("results/str/swiss/{dataset}_pos.txt", dataset = DATASETS),
        expand("results/str/swiss/{dataset}_neg.txt", dataset = DATASETS),
        expand("results/str/kmindex/{dataset}_pos.txt", dataset = DATASETS),
        expand("results/str/kmindex/{dataset}_neg.txt", dataset = DATASETS),
        expand("results/str/fuze/{dataset}_pos.txt", dataset = DATASETS),
        expand("results/str/fuze/{dataset}_neg.txt", dataset = DATASETS),
        expand("results/str/sklib/{dataset}_pos.txt", dataset = DATASETS),
        expand("results/str/sklib/{dataset}_neg.txt", dataset = DATASETS),
        expand("results/inter/sbwt_rc/{combination}.txt", combination = COMBINATIONS), #intersections
        expand("results/inter/sbwt_norc/{combination}.txt", combination = COMBINATIONS),
        expand("results/inter/cbl/{combination}.txt", combination = COMBINATIONS),
        expand("results/inter/fmsi/{combination}.txt", combination = COMBINATIONS),
        #expand("results/inter/fmsi_dist/{combination}.txt", combination = COMBINATIONS),
        expand("results/inter/sklib/{combination}.txt", combination = COMBINATIONS),
        expand("results/inter/kmc_can/{combination}.txt", combination = COMBINATIONS),
        expand("results/inter/kmc_noncan/{combination}.txt", combination = COMBINATIONS),
        expand("results/ram1/sbwt_rc/{dataset}_pos.txt", dataset = DATASETS), #ram single queries
        expand("results/ram1/sbwt_rc/{dataset}_neg.txt", dataset = DATASETS),
        expand("results/ram1/sbwt_norc/{dataset}_pos.txt", dataset = DATASETS),
        expand("results/ram1/sbwt_norc/{dataset}_neg.txt", dataset = DATASETS),
        expand("results/ram1/bqf_can/{dataset}_pos.txt", dataset = DATASETS),
        expand("results/ram1/bqf_can/{dataset}_neg.txt", dataset = DATASETS),
        expand("results/ram1/bqf_noncan/{dataset}_pos.txt", dataset = DATASETS),
        expand("results/ram1/bqf_noncan/{dataset}_neg.txt", dataset = DATASETS),
        expand("results/ram1/sshash_can/{dataset}_pos.txt", dataset = DATASETS),
        expand("results/ram1/sshash_can/{dataset}_neg.txt", dataset = DATASETS),
        expand("results/ram1/sshash_noncan/{dataset}_pos.txt", dataset = DATASETS),
        expand("results/ram1/sshash_noncan/{dataset}_neg.txt", dataset = DATASETS),
        expand("results/ram1/sbb/{dataset}_pos.txt", dataset = DATASETS),
        expand("results/ram1/sbb/{dataset}_neg.txt", dataset = DATASETS),
        #expand("results/ram1/fmsi_same/{dataset}_pos.txt", dataset = DATASETS),
        #expand("results/ram1/fmsi_same/{dataset}_neg.txt", dataset = DATASETS),
        #expand("results/ram1/fmsi_dist/{dataset}_pos.txt", dataset = DATASETS),
        #expand("results/ram1/fmsi_dist/{dataset}_neg.txt", dataset = DATASETS),
        expand("results/ram1/cbl/{dataset}_pos.txt", dataset = DATASETS),
        expand("results/ram1/cbl/{dataset}_neg.txt", dataset = DATASETS),
        expand("results/ram1/swiss/{dataset}_pos.txt", dataset = DATASETS),
        expand("results/ram1/swiss/{dataset}_neg.txt", dataset = DATASETS),
        expand("results/ram1/kmindex/{dataset}_pos.txt", dataset = DATASETS),
        expand("results/ram1/kmindex/{dataset}_neg.txt", dataset = DATASETS),
        expand("results/ram1/fuze/{dataset}_pos.txt", dataset = DATASETS),
        expand("results/ram1/fuze/{dataset}_neg.txt", dataset = DATASETS),
        expand("results/ram1/sklib/{dataset}_pos.txt", dataset = DATASETS),
        expand("results/ram1/sklib/{dataset}_neg.txt", dataset = DATASETS),
        expand("results/ramstr/sbwt_rc/{dataset}_pos.txt", dataset = DATASETS), #ram streaming queries
        expand("results/ramstr/sbwt_rc/{dataset}_neg.txt", dataset = DATASETS),
        expand("results/ramstr/sbwt_norc/{dataset}_pos.txt", dataset = DATASETS),
        expand("results/ramstr/sbwt_norc/{dataset}_neg.txt", dataset = DATASETS),
        expand("results/ramstr/bqf_can/{dataset}_pos.txt", dataset = DATASETS),
        expand("results/ramstr/bqf_can/{dataset}_neg.txt", dataset = DATASETS),
        expand("results/ramstr/bqf_noncan/{dataset}_pos.txt", dataset = DATASETS),
        expand("results/ramstr/bqf_noncan/{dataset}_neg.txt", dataset = DATASETS),
        expand("results/ramstr/sshash_can/{dataset}_pos.txt", dataset = DATASETS),
        expand("results/ramstr/sshash_can/{dataset}_neg.txt", dataset = DATASETS),
        expand("results/ramstr/sshash_noncan/{dataset}_pos.txt", dataset = DATASETS),
        expand("results/ramstr/sshash_noncan/{dataset}_neg.txt", dataset = DATASETS),
        expand("results/ramstr/sbb/{dataset}_pos.txt", dataset = DATASETS),
        expand("results/ramstr/sbb/{dataset}_neg.txt", dataset = DATASETS),
        #expand("results/ramstr/fmsi_same/{dataset}_pos.txt", dataset = DATASETS),
        #expand("results/ramstr/fmsi_same/{dataset}_neg.txt", dataset = DATASETS),
        #expand("results/ramstr/fmsi_dist/{dataset}_pos.txt", dataset = DATASETS),
        #expand("results/ramstr/fmsi_dist/{dataset}_neg.txt", dataset = DATASETS),
        expand("results/ramstr/cbl/{dataset}_pos.txt", dataset = DATASETS),
        expand("results/ramstr/cbl/{dataset}_neg.txt", dataset = DATASETS),
        expand("results/ramstr/swiss/{dataset}_pos.txt", dataset = DATASETS),
        expand("results/ramstr/swiss/{dataset}_neg.txt", dataset = DATASETS),
        expand("results/ramstr/kmindex/{dataset}_pos.txt", dataset = DATASETS),
        expand("results/ramstr/kmindex/{dataset}_neg.txt", dataset = DATASETS),
        expand("results/ramstr/fuze/{dataset}_pos.txt", dataset = DATASETS),
        expand("results/ramstr/fuze/{dataset}_neg.txt", dataset = DATASETS),
        expand("results/ramstr/sklib/{dataset}_pos.txt", dataset = DATASETS),
        expand("results/ramstr/sklib/{dataset}_neg.txt", dataset = DATASETS),
        expand("results/raminter/sbwt_rc/{combination}.txt", combination = COMBINATIONS), #ram intersection
        expand("results/raminter/sbwt_norc/{combination}.txt", combination = COMBINATIONS),
        expand("results/raminter/cbl/{combination}.txt", combination = COMBINATIONS),
        expand("results/raminter/fmsi/{combination}.txt", combination = COMBINATIONS),
        #expand("results/raminter/fmsi_dist/{combination}.txt", combination = COMBINATIONS),
        expand("results/raminter/sklib/{combination}.txt", combination = COMBINATIONS),
        expand("results/raminter/kmc_can/{combination}.txt", combination = COMBINATIONS),
        expand("results/raminter/kmc_noncan/{combination}.txt", combination = COMBINATIONS)
    output:
        "results/1/extractor1.py",
        "results/scatteR1.R"
    shell:
        """
        cp pyscripts/extractor1.py results/1/
        cp pyscripts/extractor1.py results/str/
        cp pyscripts/extractorinter.py results/inter/
        cp pyscripts/extractorram1.py results/ram1/
        cp pyscripts/extractorram1.py results/ramstr/
        cp pyscripts/extractorraminter.py results/raminter/
        cp pyscripts/{{scatteR1.R,scatteRinter.R,scatteRstr.R}} results/
        """
        

rule helicase:
    input:
        "genomes/{sample}.fa"
    output:
        "arrows/{sample}.arrow"
    shell:
        "./helicase/target/release/extract_kmer -b 3 -k 31 -o {output} {input} || true"

rule bigtable:
    input:
        "arrows/{sample}.arrow"
    output:
        "parsed_genomes/{sample}_k31.fa"
    shell:
        "python3 ./bigtable/bigtable_manager.py -k 31 -o {output} -i {input}"

rule eulertigs:
    input:
        "parsed_genomes/{sample}_k31.fa"
    output:
        "eulertigs/{sample}_k31_e.fa"
    shell:
        "ggcat build --eulertigs -k 31 -s 1 -o {output} {input}"

### INDEXES

rule index_sbwt_rc:
    input:
        "eulertigs/{sample}_k31_e.fa"
    output:
        "indexes/sbwt_rc/{sample}.sbwt",
        "indexes/sbwt_rc/{sample}.lcs"
    shell:
        "./bench/sbwt-rs-cli/target/release/sbwt build -l -r -i {input} -o indexes/sbwt_rc/{wildcards.sample} -k 31"

rule index_sbwt_norc:
    input:
        "eulertigs/{sample}_k31_e.fa"
    output:
        "indexes/sbwt_norc/{sample}.sbwt",
        "indexes/sbwt_norc/{sample}.lcs"
    shell:
        "./bench/sbwt-rs-cli/target/release/sbwt build -l -i {input} -o indexes/sbwt_norc/{wildcards.sample} -k 31"

rule kmc_can:
    input:
        "eulertigs/{sample}_k31_e.fa"
    output:
        "kmc/{sample}_k25_can.kmc_pre",
        "kmc/{sample}_k25_can.kmc_suf",
    shell:
        "mkdir kmc/{wildcards.sample}_can && ./utils/kmc/bin/kmc -fm -k25 -ci1 {input} kmc/{wildcards.sample}_k25_can kmc/{wildcards.sample}_can"

rule kmc_noncan:
    input:
        "eulertigs/{sample}_k31_e.fa"
    output:
        "kmc/{sample}_k25_noncan.kmc_pre",
        "kmc/{sample}_k25_noncan.kmc_suf",
    shell:
        "mkdir kmc/{wildcards.sample}_noncan && ./utils/kmc/bin/kmc -fm -b -k25 -ci1 {input} kmc/{wildcards.sample}_k25_noncan kmc/{wildcards.sample}_noncan"

rule index_bqf_can:
    input:
        "kmc/{sample}_k25_can.kmc_pre",
        "kmc/{sample}_k25_can.kmc_suf",
    output:
        "indexes/bqf_can/{sample}.bqf"
    shell:
        "./bench/bqf/build/bin/bqf build -i kmc/{wildcards.sample}_k25_can -o {output} -k 31 -z 16"

rule index_bqf_noncan:
    input:
        "kmc/{sample}_k25_noncan.kmc_pre",
        "kmc/{sample}_k25_noncan.kmc_suf",
    output:
        "indexes/bqf_noncan/{sample}.bqf"
    shell:
        "./bench/bqf/build/bin/bqf build -i kmc/{wildcards.sample}_k25_can -o {output} -k 31 -z 16"

rule index_sshash_can:
    input:
        "eulertigs/{sample}_k31_e.fa"
    output:
        "indexes/sshash_can/{sample}.sshash"
    shell:
        "./bench/sshash/build/sshash build -i {input} -k 31 -m 10 -o {output} --canonical"

rule index_sshash_noncan:
    input:
        "eulertigs/{sample}_k31_e.fa"
    output:
        "indexes/sshash_noncan/{sample}.sshash"
    shell:
        "./bench/sshash/build/sshash build -i {input} -k 31 -m 10 -o {output}"

rule index_sbb:
    input:
        "eulertigs/{sample}_k31_e.fa"
    output:
        "indexes/sbb/{sample}.bf.zst"
    shell:
        "./bench/SBB/target/release/sbb maker -k 31 -p indexes/sbb/{wildcards.sample} {input}"

rule kmercamel:
    input:
        "eulertigs/{sample}_k31_e.fa"
    output:
        "indexes/fmsi/{sample}.msfa"
    shell:
        "./utils/kmercamel/kmercamel compute -S -k 31 -o {output} {input}"

"""rule kmercamel_dist:
    input:
        "eulertigs/{sample}_k31_e.fa"
    output:
        "indexes/fmsi_dist/{sample}.msfa"
    shell:
        "./utils/kmercamel/kmercamel compute -u -S -k 31 -o {output} {input}"
"""
rule index_fmsi:
    input:
        "indexes/fmsi/{sample}.msfa"
    output:
        "indexes/fmsi/{sample}.msfa.fmsi.ac"
    shell:
        "./bench/fmsi/fmsi index -k 31 {input}"
"""
rule index_fmsi_dist:
    input:
        "indexes/fmsi_dist/{sample}.msfa"
    output:
        "indexes/fmsi_dist/{sample}.msfa.fmsi.ac"
    shell:
        "./bench/fmsi/fmsi index -k 31 {input}"
"""
rule index_cbl:
    input:
        "eulertigs/{sample}_k31_e.fa"
    output:
        "indexes/cbl/{sample}.cbl"
    shell:
        "./bench/cbl/cbl build -o {output} -c {input}"

rule index_swiss:
    input:
        "eulertigs/{sample}_k31_e.fa"
    output:
        "indexes/swiss/{sample}.mp"
    shell:
        "./bench/ST/translation/target/debug/translation -k 31 -f {input} -o {output}"

rule index_kmindex:
    input:
        "eulertigs/{sample}_k31_e.fa"
    output:
        "indexes/kmindex/{sample}_fof.txt"
    conda:
        "envs/kmindex.yaml"
    shell:
        "mkdir -p indexes/kmindex && ( echo {wildcards.sample} : {input} ) > {output} && kmindex build -f {output} -d indexes/kmindex/{wildcards.sample}_rundir/ -i indexes/kmindex/{wildcards.sample} -r {wildcards.sample}.kmi -k 25 --hard-min 1 --bloom-size 2000000000"

rule index_fuze:
    input:
        "eulertigs/{sample}_k31_e.fa"
    output:
        "indexes/fuze/{sample}.mp"
    shell:
        "./bench/fuze/target/release/fuze build -k 25 -f {input} -o {output}"

rule index_sklib:
    input:
        "eulertigs/{sample}_k31_e.fa"
    output:
        "indexes/sklib/{sample}.sk"
    shell:
        "./bench/sklib/build/bin/sskm construct -f {input} -o {output} -k 31 -m 15"

rule index_kmc_can:
    input:
        "eulertigs/{sample}_k31_e.fa"
    output:
        "indexes/kmc_can/{sample}_k31.kmc_pre",
        "indexes/kmc_can/{sample}_k31.kmc_suf"
    shell:
        "mkdir -p indexes/kmc_can/{wildcards.sample} && ./utils/kmc/bin/kmc -fm -k31 -ci1 {input} indexes/kmc_can/{wildcards.sample}_k31 indexes/kmc_can/{wildcards.sample}"

rule index_kmc_noncan:
    input:
        "eulertigs/{sample}_k31_e.fa"
    output:
        "indexes/kmc_noncan/{sample}_k31.kmc_pre",
        "indexes/kmc_noncan/{sample}_k31.kmc_suf"
    shell:
        "mkdir -p indexes/kmc_noncan/{wildcards.sample} && ./utils/kmc/bin/kmc -fm -b -k31 -ci1 {input} indexes/kmc_noncan/{wildcards.sample}_k31 indexes/kmc_noncan/{wildcards.sample}"

### QUERY DATASETS

rule pos_queries:
    input:
        "eulertigs/{sample}_k31_e.fa"
    output:
        "queries/{sample}_pos.fa"
    shell:
        "python3 utils/pos_query.py -i {input} -k 31 -o {output} -n 100000"

rule neg_queries:
    input:
        "eulertigs/{sample}_k31_e.fa"
    output:
        "queries/{sample}_neg.fa"
    shell:
        "python3 utils/neg_query.py -i {input} -k 31 -o {output} -n 100000"

rule pos_streaming:
    input:
        "eulertigs/{sample}_k31_e.fa"
    output:
        "queries/streaming/{sample}_pos.fa"
    shell:
        "python3 utils/streaming_pos.py -i {input} -k 31 -o {output} -n 100000"

rule neg_streaming:
    input:
        "eulertigs/{sample}_k31_e.fa"
    output:
        "queries/streaming/{sample}_neg.fa"
    shell:
        "utils/streaming_neg/target/release/streaming_neg -k 31 -o {output} -i {input} -n 100000"

### SINGLE QUERIES

rule query_pos_sbwt_rc:
    input:
        sbwt = "indexes/sbwt_rc/{sample}.sbwt",
        query = "queries/{sample}_pos.fa"
    output:
        out = "output/1/sbwt_rc/{sample}_pos.txt",
        res = "results/1/sbwt_rc/{sample}_pos.txt"
    shell:
        "for loop in {{0..9}}; do ( time ./bench/sbwt-rs-cli/target/release/sbwt lookup -i {input.sbwt} -o {output.out} -q {input.query} -t 1 -b ) 2>> {output.res}; done"

rule query_neg_sbwt_rc:
    input:
        sbwt = "indexes/sbwt_rc/{sample}.sbwt",
        query = "queries/{sample}_neg.fa"
    output:
        out = "output/1/sbwt_rc/{sample}_neg.txt",
        res = "results/1/sbwt_rc/{sample}_neg.txt"
    shell:
        "for loop in {{0..9}}; do ( time ./bench/sbwt-rs-cli/target/release/sbwt lookup -i {input.sbwt} -o {output.out} -q {input.query} -t 1 -b ) 2>> {output.res}; done"

rule query_pos_sbwt_norc:
    input:
        sbwt = "indexes/sbwt_norc/{sample}.sbwt",
        query = "queries/{sample}_pos.fa"
    output:
        out = "output/1/sbwt_norc/{sample}_pos.txt",
        res = "results/1/sbwt_norc/{sample}_pos.txt"
    shell:
        "for loop in {{0..9}}; do ( time ./bench/sbwt-rs-cli/target/release/sbwt lookup -i {input.sbwt} -o {output.out} -q {input.query} -t 1 -b ) 2>> {output.res}; done"

rule query_neg_sbwt_norc:
    input:
        sbwt = "indexes/sbwt_norc/{sample}.sbwt",
        query = "queries/{sample}_neg.fa"
    output:
        out = "output/1/sbwt_norc/{sample}_neg.txt",
        res = "results/1/sbwt_norc/{sample}_neg.txt"
    shell:
        "for loop in {{0..9}}; do ( time ./bench/sbwt-rs-cli/target/release/sbwt lookup -i {input.sbwt} -o {output.out} -q {input.query} -t 1 -b ) 2>> {output.res}; done"

rule query_pos_bqf_can:
    input:
        bqf = "indexes/bqf_can/{sample}.bqf",
        query = "queries/{sample}_pos.fa"
    output:
        out = "output/1/bqf_can/{sample}_pos.txt",
        res = "results/1/bqf_can/{sample}_pos.txt"
    shell:
        "for loop in {{0..9}}; do ( time ./bench/bqf/build/bin/bqf query -b {input.bqf} -i {input.query} -o {output.out} ) 2>> {output.res}; done"

rule query_neg_bqf_can:
    input:
        bqf = "indexes/bqf_can/{sample}.bqf",
        query = "queries/{sample}_neg.fa"
    output:
        out = "output/1/bqf_can/{sample}_neg.txt",
        res = "results/1/bqf_can/{sample}_neg.txt"
    shell:
        "for loop in {{0..9}}; do ( time ./bench/bqf/build/bin/bqf query -b {input.bqf} -i {input.query} -o {output.out} ) 2>> {output.res}; done"

rule query_pos_bqf_noncan:
    input:
        bqf = "indexes/bqf_noncan/{sample}.bqf",
        query = "queries/{sample}_pos.fa"
    output:
        out = "output/1/bqf_noncan/{sample}_pos.txt",
        res = "results/1/bqf_noncan/{sample}_pos.txt"
    shell:
        "for loop in {{0..9}}; do ( time ./bench/bqf/build/bin/bqf query -b {input.bqf} -i {input.query} -o {output.out} ) 2>> {output.res}; done"

rule query_neg_bqf_noncan:
    input:
        bqf = "indexes/bqf_noncan/{sample}.bqf",
        query = "queries/{sample}_neg.fa"
    output:
        out = "output/1/bqf_noncan/{sample}_neg.txt",
        res = "results/1/bqf_noncan/{sample}_neg.txt"
    shell:
        "for loop in {{0..9}}; do ( time ./bench/bqf/build/bin/bqf query -b {input.bqf} -i {input.query} -o {output.out} ) 2>> {output.res}; done"

rule query_pos_sshash_can:
    input:
        sshash = "indexes/sshash_can/{sample}.sshash",
        query = "queries/{sample}_pos.fa"
    output:
        "results/1/sshash_can/{sample}_pos.txt"
    shell:
        "for loop in {{0..9}}; do ( time ./bench/sshash/build/sshash query -i {input.sshash} -q {input.query} ) 2>> {output}; done"

rule query_neg_sshash_can:
    input:
        sshash = "indexes/sshash_can/{sample}.sshash",
        query = "queries/{sample}_neg.fa"
    output:
        "results/1/sshash_can/{sample}_neg.txt"
    shell:
        "for loop in {{0..9}}; do ( time ./bench/sshash/build/sshash query -i {input.sshash} -q {input.query} ) 2>> {output}; done"

rule query_pos_sshash_noncan:
    input:
        sshash = "indexes/sshash_noncan/{sample}.sshash",
        query = "queries/{sample}_pos.fa"
    output:
        "results/1/sshash_noncan/{sample}_pos.txt"
    shell:
        "for loop in {{0..9}}; do ( time ./bench/sshash/build/sshash query -i {input.sshash} -q {input.query} ) 2>> {output}; done"

rule query_neg_sshash_noncan:
    input:
        sshash = "indexes/sshash_noncan/{sample}.sshash",
        query = "queries/{sample}_neg.fa"
    output:
        "results/1/sshash_noncan/{sample}_neg.txt"
    shell:
        "for loop in {{0..9}}; do ( time ./bench/sshash/build/sshash query -i {input.sshash} -q {input.query} ) 2>> {output}; done"

rule query_pos_sbb:
    input:
        sbb = "indexes/sbb/{sample}.bf.zst",
        query = "queries/{sample}_pos.fa"
    output:
        "results/1/sbb/{sample}_pos.txt"
    shell:
        "mkdir -p ./output/1/sbb && for loop in {{0..9}}; do ( time ./bench/SBB/target/release/sbb recruit -p output/1/sbb/{wildcards.sample}_pos -f {input.sbb} --fa {input.query} -t 1 ) 2>> {output}; done"

rule query_neg_sbb:
    input:
        sbb = "indexes/sbb/{sample}.bf.zst",
        query = "queries/{sample}_neg.fa"
    output:
        "results/1/sbb/{sample}_neg.txt"
    shell:
        "mkdir -p ./output/1/sbb && for loop in {{0..9}}; do ( time ./bench/SBB/target/release/sbb recruit -p output/1/sbb/{wildcards.sample}_neg -f {input.sbb} --fa {input.query} -t 1 ) 2>> {output}; done"

"""rule query_pos_fmsi_same:
    input:
        fmsi = "indexes/fmsi_same/{sample}.msfa.fmsi.ac",
        query = "queries/{sample}_pos.fa"
    output:
        "results/1/fmsi_same/{sample}_pos.txt"
    shell:
        "for loop in {{0..9}}; do ( time ./bench/fmsi/fmsi query -q {input.query} -k 31 indexes/fmsi_same/{wildcards.sample}.msfa ) 2>> {output}; done"

rule query_neg_fmsi_same:
    input:
        fmsi = "indexes/fmsi_same/{sample}.msfa.fmsi.ac",
        query = "queries/{sample}_neg.fa"
    output:
        "results/1/fmsi_same/{sample}_neg.txt"
    shell:
        "for loop in {{0..9}}; do ( time ./bench/fmsi/fmsi query -q {input.query} -k 31 indexes/fmsi_same/{wildcards.sample}.msfa ) 2>> {output}; done"

rule query_pos_fmsi_dist:
    input:
        fmsi = "indexes/fmsi_dist/{sample}.msfa.fmsi.ac",
        query = "queries/{sample}_pos.fa"
    output:
        "results/1/fmsi_dist/{sample}_pos.txt"
    shell:
        "for loop in {{0..9}}; do ( time ./bench/fmsi/fmsi query -q {input.query} -k 31 indexes/fmsi_dist/{wildcards.sample}.msfa ) 2>> {output}; done"

rule query_neg_fmsi_dist:
    input:
        fmsi = "indexes/fmsi_dist/{sample}.msfa.fmsi.ac",
        query = "queries/{sample}_neg.fa"
    output:
        "results/1/fmsi_dist/{sample}_neg.txt"
    shell:
        "for loop in {{0..9}}; do ( time ./bench/fmsi/fmsi query -q {input.query} -k 31 indexes/fmsi_dist/{wildcards.sample}.msfa ) 2>> {output}; done"
"""
rule query_pos_cbl:
    input:
        cbl = "indexes/cbl/{sample}.cbl",
        query = "queries/{sample}_pos.fa"
    output:
        "results/1/cbl/{sample}_pos.txt"
    shell:
        "for loop in {{0..9}}; do ( time ./bench/cbl/cbl query {input.cbl} {input.query} ) 2>> {output}; done"

rule query_neg_cbl:
    input:
        cbl = "indexes/cbl/{sample}.cbl",
        query = "queries/{sample}_neg.fa"
    output:
        "results/1/cbl/{sample}_neg.txt"
    shell:
        "for loop in {{0..9}}; do ( time ./bench/cbl/cbl query {input.cbl} {input.query} ) 2>> {output}; done"

rule query_pos_swiss:
    input:
        swiss = "indexes/swiss/{sample}.mp",
        query = "queries/{sample}_pos.fa"
    output:
        "results/1/swiss/{sample}_pos.txt"
    shell:
        "for loop in {{0..9}}; do ( time ./bench/ST/cheesy_query/target/release/cheesy_query -k 31 -q {input.query} -i {input.swiss} ) 2>> {output}; done"

rule query_neg_swiss:
    input:
        swiss = "indexes/swiss/{sample}.mp",
        query = "queries/{sample}_neg.fa"
    output:
        "results/1/swiss/{sample}_neg.txt"
    shell:
        "for loop in {{0..9}}; do ( time ./bench/ST/cheesy_query/target/release/cheesy_query -k 31 -q {input.query} -i {input.swiss} ) 2>> {output}; done"

rule query_pos_kmindex:
    input:
        chainer = "indexes/kmindex/{sample}_fof.txt",
        query = "queries/{sample}_pos.fa"
    output:
        "results/1/kmindex/{sample}_pos.txt"
    conda:
        "envs/kmindex.yaml"
    shell:
        "for loop in {{0..9}}; do ( time kmindex query -i indexes/kmindex/{wildcards.sample}/ -z 6 -o output/1/kmindex/{wildcards.sample}_pos_$loop -q {input.query} -t 1 ) 2>> {output}; done"

rule query_neg_kmindex:
    input:
        chainer = "indexes/kmindex/{sample}_fof.txt",
        query = "queries/{sample}_neg.fa"
    output:
        "results/1/kmindex/{sample}_neg.txt"
    conda:
        "envs/kmindex.yaml"
    shell:
        "for loop in {{0..9}}; do ( time kmindex query -i indexes/kmindex/{wildcards.sample}/ -z 6 -o output/1/kmindex/{wildcards.sample}_neg_$loop -q {input.query} -t 1 ) 2>> {output}; done"

rule query_pos_fuze:
    input:
        fuze = "indexes/fuze/{sample}.mp",
        query = "queries/{sample}_pos.fa"
    output:
        "results/1/fuze/{sample}_pos.txt"
    shell:
        "for loop in {{0..9}}; do ( time ./bench/fuze/target/release/fuze query -k 31 -z 6 -i {input.fuze} -q {input.query} ) 2>> {output}; done"

rule query_neg_fuze:
    input:
        fuze = "indexes/fuze/{sample}.mp",
        query = "queries/{sample}_neg.fa"
    output:
        "results/1/fuze/{sample}_neg.txt"
    shell:
        "for loop in {{0..9}}; do ( time ./bench/fuze/target/release/fuze query -k 31 -z 6 -i {input.fuze} -q {input.query} ) 2>> {output}; done"

rule query_pos_sklib:
    input:
        sklib = "indexes/sklib/{sample}.sk",
        query = "queries/{sample}_pos.fa"
    output:
        out = "output/1/sklib/{sample}_pos.txt",
        res = "results/1/sklib/{sample}_pos.txt"
    shell:
        "for loop in {{0..9}}; do ( time ./bench/sklib/build/bin/sskm query -l {input.sklib} -i {input.query} -o {output.out} -t 1 ) 2>> {output.res}; done"

rule query_neg_sklib:
    input:
        sklib = "indexes/sklib/{sample}.sk",
        query = "queries/{sample}_neg.fa"
    output:
        out = "output/1/sklib/{sample}_neg.txt",
        res = "results/1/sklib/{sample}_neg.txt"
    shell:
        "for loop in {{0..9}}; do ( time ./bench/sklib/build/bin/sskm query -l {input.sklib} -i {input.query} -o {output.out} -t 1 ) 2>> {output.res}; done"  

### STREAMING QUERIES

rule query_str_pos_sbwt_rc:
    input:
        sbwt = "indexes/sbwt_rc/{sample}.sbwt",
        query = "queries/streaming/{sample}_pos.fa"
    output:
        out = "output/str/sbwt_rc/{sample}_pos.txt",
        res = "results/str/sbwt_rc/{sample}_pos.txt"
    shell:
        "for loop in {{0..9}}; do ( time ./bench/sbwt-rs-cli/target/release/sbwt lookup -i {input.sbwt} -o {output.out} -q {input.query} -t 1 -b ) 2>> {output.res}; done"

rule query_str_neg_sbwt_rc:
    input:
        sbwt = "indexes/sbwt_rc/{sample}.sbwt",
        query = "queries/streaming/{sample}_neg.fa"
    output:
        out = "output/str/sbwt_rc/{sample}_neg.txt",
        res = "results/str/sbwt_rc/{sample}_neg.txt"
    shell:
        "for loop in {{0..9}}; do ( time ./bench/sbwt-rs-cli/target/release/sbwt lookup -i {input.sbwt} -o {output.out} -q {input.query} -t 1 -b ) 2>> {output.res}; done"

rule query_str_pos_sbwt_norc:
    input:
        sbwt = "indexes/sbwt_norc/{sample}.sbwt",
        query = "queries/streaming/{sample}_pos.fa"
    output:
        out = "output/str/sbwt_norc/{sample}_pos.txt",
        res = "results/str/sbwt_norc/{sample}_pos.txt"
    shell:
        "for loop in {{0..9}}; do ( time ./bench/sbwt-rs-cli/target/release/sbwt lookup -i {input.sbwt} -o {output.out} -q {input.query} -t 1 -b ) 2>> {output.res}; done"

rule query_str_neg_sbwt_norc:
    input:
        sbwt = "indexes/sbwt_norc/{sample}.sbwt",
        query = "queries/streaming/{sample}_neg.fa"
    output:
        out = "output/str/sbwt_norc/{sample}_neg.txt",
        res = "results/str/sbwt_norc/{sample}_neg.txt"
    shell:
        "for loop in {{0..9}}; do ( time ./bench/sbwt-rs-cli/target/release/sbwt lookup -i {input.sbwt} -o {output.out} -q {input.query} -t 1 -b ) 2>> {output.res}; done"

rule query_str_pos_bqf_can:
    input:
        bqf = "indexes/bqf_can/{sample}.bqf",
        query = "queries/streaming/{sample}_pos.fa"
    output:
        out = "output/str/bqf_can/{sample}_pos.txt",
        res = "results/str/bqf_can/{sample}_pos.txt"
    shell:
        "for loop in {{0..9}}; do ( time ./bench/bqf/build/bin/bqf query -b {input.bqf} -i {input.query} -o {output.out} ) 2>> {output.res}; done"

rule query_str_neg_bqf_can:
    input:
        bqf = "indexes/bqf_can/{sample}.bqf",
        query = "queries/streaming/{sample}_neg.fa"
    output:
        out = "output/str/bqf_can/{sample}_neg.txt",
        res = "results/str/bqf_can/{sample}_neg.txt"
    shell:
        "for loop in {{0..9}}; do ( time ./bench/bqf/build/bin/bqf query -b {input.bqf} -i {input.query} -o {output.out} ) 2>> {output.res}; done"

rule query_str_pos_bqf_noncan:
    input:
        bqf = "indexes/bqf_noncan/{sample}.bqf",
        query = "queries/streaming/{sample}_pos.fa"
    output:
        out = "output/str/bqf_noncan/{sample}_pos.txt",
        res = "results/str/bqf_noncan/{sample}_pos.txt"
    shell:
        "for loop in {{0..9}}; do ( time ./bench/bqf/build/bin/bqf query -b {input.bqf} -i {input.query} -o {output.out} ) 2>> {output.res}; done"

rule query_str_neg_bqf_noncan:
    input:
        bqf = "indexes/bqf_noncan/{sample}.bqf",
        query = "queries/streaming/{sample}_neg.fa"
    output:
        out = "output/str/bqf_noncan/{sample}_neg.txt",
        res = "results/str/bqf_noncan/{sample}_neg.txt"
    shell:
        "for loop in {{0..9}}; do ( time ./bench/bqf/build/bin/bqf query -b {input.bqf} -i {input.query} -o {output.out} ) 2>> {output.res}; done"

rule query_str_pos_sshash_can:
    input:
        sshash = "indexes/sshash_can/{sample}.sshash",
        query = "queries/streaming/{sample}_pos.fa"
    output:
        "results/str/sshash_can/{sample}_pos.txt"
    shell:
        "for loop in {{0..9}}; do ( time ./bench/sshash/build/sshash query -i {input.sshash} -q {input.query} ) 2>> {output}; done"

rule query_str_neg_sshash_can:
    input:
        sshash = "indexes/sshash_can/{sample}.sshash",
        query = "queries/streaming/{sample}_neg.fa"
    output:
        "results/str/sshash_can/{sample}_neg.txt"
    shell:
        "for loop in {{0..9}}; do ( time ./bench/sshash/build/sshash query -i {input.sshash} -q {input.query} ) 2>> {output}; done"

rule query_str_pos_sshash_noncan:
    input:
        sshash = "indexes/sshash_noncan/{sample}.sshash",
        query = "queries/streaming/{sample}_pos.fa"
    output:
        "results/str/sshash_noncan/{sample}_pos.txt"
    shell:
        "for loop in {{0..9}}; do ( time ./bench/sshash/build/sshash query -i {input.sshash} -q {input.query} ) 2>> {output}; done"

rule query_str_neg_sshash_noncan:
    input:
        sshash = "indexes/sshash_noncan/{sample}.sshash",
        query = "queries/streaming/{sample}_neg.fa"
    output:
        "results/str/sshash_noncan/{sample}_neg.txt"
    shell:
        "for loop in {{0..9}}; do ( time ./bench/sshash/build/sshash query -i {input.sshash} -q {input.query} ) 2>> {output}; done"

rule query_str_pos_sbb:
    input:
        sbb = "indexes/sbb/{sample}.bf.zst",
        query = "queries/streaming/{sample}_pos.fa"
    output:
        "results/str/sbb/{sample}_pos.txt"
    shell:
        "mkdir -p ./output/str/sbb && for loop in {{0..9}}; do ( time ./bench/SBB/target/release/sbb recruit -p output/str/sbb/{wildcards.sample}_pos -f {input.sbb} --fa {input.query} -t 1 ) 2>> {output}; done"

rule query_str_neg_sbb:
    input:
        sbb = "indexes/sbb/{sample}.bf.zst",
        query = "queries/streaming/{sample}_neg.fa"
    output:
        "results/str/sbb/{sample}_neg.txt"
    shell:
        "mkdir -p ./output/str/sbb && for loop in {{0..9}}; do ( time ./bench/SBB/target/release/sbb recruit -p output/str/sbb/{wildcards.sample}_neg -f {input.sbb} --fa {input.query} -t 1 ) 2>> {output}; done"
"""
rule query_str_pos_fmsi_same:
    input:
        fmsi = "indexes/fmsi_same/{sample}.msfa.fmsi.ac",
        query = "queries/streaming/{sample}_pos.fa"
    output:
        "results/str/fmsi_same/{sample}_pos.txt"
    shell:
        "for loop in {{0..9}}; do ( time ./bench/fmsi/fmsi query -q {input.query} -k 31 indexes/fmsi_same/{wildcards.sample}.msfa ) 2>> {output}; done"

rule query_str_neg_fmsi_same:
    input:
        fmsi = "indexes/fmsi_same/{sample}.msfa.fmsi.ac",
        query = "queries/streaming/{sample}_neg.fa"
    output:
        "results/str/fmsi_same/{sample}_neg.txt"
    shell:
        "for loop in {{0..9}}; do ( time ./bench/fmsi/fmsi query -q {input.query} -k 31 indexes/fmsi_same/{wildcards.sample}.msfa ) 2>> {output}; done"

rule query_str_pos_fmsi_dist:
    input:
        fmsi = "indexes/fmsi_dist/{sample}.msfa.fmsi.ac",
        query = "queries/streaming/{sample}_pos.fa"
    output:
        "results/str/fmsi_dist/{sample}_pos.txt"
    shell:
        "for loop in {{0..9}}; do ( time ./bench/fmsi/fmsi query -q {input.query} -k 31 indexes/fmsi_dist/{wildcards.sample}.msfa ) 2>> {output}; done"

rule query_str_neg_fmsi_dist:
    input:
        fmsi = "indexes/fmsi_dist/{sample}.msfa.fmsi.ac",
        query = "queries/streaming/{sample}_neg.fa"
    output:
        "results/str/fmsi_dist/{sample}_neg.txt"
    shell:
        "for loop in {{0..9}}; do ( time ./bench/fmsi/fmsi query -q {input.query} -k 31 indexes/fmsi_dist/{wildcards.sample}.msfa ) 2>> {output}; done"
"""
rule query_str_pos_cbl:
    input:
        cbl = "indexes/cbl/{sample}.cbl",
        query = "queries/streaming/{sample}_pos.fa"
    output:
        "results/str/cbl/{sample}_pos.txt"
    shell:
        "for loop in {{0..9}}; do ( time ./bench/cbl/cbl query {input.cbl} {input.query} ) 2>> {output}; done"

rule query_str_neg_cbl:
    input:
        cbl = "indexes/cbl/{sample}.cbl",
        query = "queries/streaming/{sample}_neg.fa"
    output:
        "results/str/cbl/{sample}_neg.txt"
    shell:
        "for loop in {{0..9}}; do ( time ./bench/cbl/cbl query {input.cbl} {input.query} ) 2>> {output}; done"

rule query_str_pos_swiss:
    input:
        swiss = "indexes/swiss/{sample}.mp",
        query = "queries/streaming/{sample}_pos.fa"
    output:
        "results/str/swiss/{sample}_pos.txt"
    shell:
        "for loop in {{0..9}}; do ( time ./bench/ST/cheesy_query/target/release/cheesy_query -k 31 -q {input.query} -i {input.swiss} ) 2>> {output}; done"

rule query_str_neg_swiss:
    input:
        swiss = "indexes/swiss/{sample}.mp",
        query = "queries/streaming/{sample}_neg.fa"
    output:
        "results/str/swiss/{sample}_neg.txt"
    shell:
        "for loop in {{0..9}}; do ( time ./bench/ST/cheesy_query/target/release/cheesy_query -k 31 -q {input.query} -i {input.swiss} ) 2>> {output}; done"

rule query_str_pos_kmindex:
    input:
        chainer = "indexes/kmindex/{sample}_fof.txt",
        query = "queries/streaming/{sample}_pos.fa"
    output:
        "results/str/kmindex/{sample}_pos.txt"
    conda:
        "envs/kmindex.yaml"
    shell:
        "for loop in {{0..9}}; do ( time kmindex query -i indexes/kmindex/{wildcards.sample}/ -z 6 -o output/str/kmindex/{wildcards.sample}_pos_$loop -q {input.query} -t 1 ) 2>> {output}; done"

rule query_str_neg_kmindex:
    input:
        chainer = "indexes/kmindex/{sample}_fof.txt",
        query = "queries/streaming/{sample}_neg.fa"
    output:
        "results/str/kmindex/{sample}_neg.txt"
    conda:
        "envs/kmindex.yaml"
    shell:
        "for loop in {{0..9}}; do ( time kmindex query -i indexes/kmindex/{wildcards.sample}/ -z 6 -o output/str/kmindex/{wildcards.sample}_neg_$loop -q {input.query} -t 1 ) 2>> {output}; done"

rule query_str_pos_fuze:
    input:
        fuze = "indexes/fuze/{sample}.mp",
        query = "queries/streaming/{sample}_pos.fa"
    output:
        "results/str/fuze/{sample}_pos.txt"
    shell:
        "for loop in {{0..9}}; do ( time ./bench/fuze/target/release/fuze query -k 31 -z 6 -i {input.fuze} -q {input.query} ) 2>> {output}; done"

rule query_str_neg_fuze:
    input:
        fuze = "indexes/fuze/{sample}.mp",
        query = "queries/streaming/{sample}_neg.fa"
    output:
        "results/str/fuze/{sample}_neg.txt"
    shell:
        "for loop in {{0..9}}; do ( time ./bench/fuze/target/release/fuze query -k 31 -z 6 -i {input.fuze} -q {input.query} ) 2>> {output}; done"

rule query_str_pos_sklib:
    input:
        sklib = "indexes/sklib/{sample}.sk",
        query = "queries/streaming/{sample}_pos.fa"
    output:
        out = "output/str/sklib/{sample}_pos.txt",
        res = "results/str/sklib/{sample}_pos.txt"
    shell:
        "for loop in {{0..9}}; do ( time ./bench/sklib/build/bin/sskm query -l {input.sklib} -i {input.query} -o {output.out} -t 1 ) 2>> {output.res}; done"

rule query_str_neg_sklib:
    input:
        sklib = "indexes/sklib/{sample}.sk",
        query = "queries/streaming/{sample}_neg.fa"
    output:
        out = "output/str/sklib/{sample}_neg.txt",
        res = "results/str/sklib/{sample}_neg.txt"
    shell:
        "for loop in {{0..9}}; do ( time ./bench/sklib/build/bin/sskm query -l {input.sklib} -i {input.query} -o {output.out} -t 1 ) 2>> {output.res}; done"  

### INTERSECTIONS

rule inter_sbwt_rc:
    input:
        sbwt1 = "indexes/sbwt_rc/{index1}.sbwt",
        sbwt2 = "indexes/sbwt_rc/{index2}.sbwt"
    output:
        out = "output/inter/sbwt_rc/{index1}:{index2}.sbwt",
        res = "results/inter/sbwt_rc/{index1}:{index2}.txt"
    shell:
        "for loop in {{0..9}}; do ( time ./bench/sbwt-rs-cli/target/release/sbwt intersect -t 1 -o output/inter/sbwt_rc/{wildcards.index1}:{wildcards.index2}.sbwt {input.sbwt1} {input.sbwt2} ) 2>> {output.res}; done"

rule inter_sbwt_norc:
    input:
        sbwt1 = "indexes/sbwt_norc/{index1}.sbwt",
        sbwt2 = "indexes/sbwt_norc/{index2}.sbwt"
    output:
        out = "output/inter/sbwt_norc/{index1}:{index2}.sbwt",
        res = "results/inter/sbwt_norc/{index1}:{index2}.txt"
    shell:
        "for loop in {{0..9}}; do ( time ./bench/sbwt-rs-cli/target/release/sbwt intersect -t 1 -o output/inter/sbwt_norc/{wildcards.index1}:{wildcards.index2}.sbwt {input.sbwt1} {input.sbwt2} ) 2>> {output.res}; done"

rule inter_cbl:
    input:
        cbl1 = "indexes/cbl/{index1}.cbl",
        cbl2 = "indexes/cbl/{index2}.cbl"
    output:
        out = "output/inter/cbl/{index1}:{index2}.cbl",
        res = "results/inter/cbl/{index1}:{index2}.txt"
    shell:
        "for loop in {{0..9}}; do ( time ./bench/cbl/cbl inter -o {output.out} {input.cbl1} {input.cbl2} ) 2>> {output.res}; done"

rule inter_fmsi:
    input:
        fmsi1 = "indexes/fmsi/{index1}.msfa",
        fmsi2 = "indexes/fmsi/{index2}.msfa"
    output:
        out = "output/inter/fmsi/{index1}:{index2}.fmsi.ac",
        res = "results/inter/fmsi/{index1}:{index2}.txt"
    shell:
        "for loop in {{0..9}}; do ( time ./bench/fmsi/fmsi inter -r output/inter/fmsi/{wildcards.index1}:{wildcards.index2} -p {input.fmsi1} -p {input.fmsi2} -k 31 ) 2>> {output.res}; done"
"""
rule inter_fmsi_dist:
    input:
        fmsi1 = "indexes/fmsi_dist/{index1}.msfa",
        fmsi2 = "indexes/fmsi_dist/{index2}.msfa"
    output:
        out = "output/inter/fmsi_dist/{index1}:{index2}.fmsi.ac",
        res = "results/inter/fmsi_dist/{index1}:{index2}.txt"
    shell:
        "for loop in {{0..9}}; do ( time ./bench/fmsi/fmsi inter -r output/inter/fmsi_dist/{wildcards.index1}:{wildcards.index2} -p {input.fmsi1} -p {input.fmsi2} -k 31 ) 2>> {output.res}; done"
"""
rule inter_sklib:
    input:
        skl1 = "indexes/sklib/{index1}.sk",
        skl2 = "indexes/sklib/{index2}.sk"
    output:
        out = "output/inter/sklib/{index1}:{index2}.sk",
        res = "results/inter/sklib/{index1}:{index2}.txt"
    shell:
        "for loop in {{0..9}}; do ( time ./bench/sklib/build/bin/sskm setop -o {output.out} -a {input.skl1} -b {input.skl2} --op intersection ) 2>> {output.res}; done"

rule inter_kmc_can:
    input:
        kmc1 = "indexes/kmc_can/{index1}_k31.kmc_pre",
        kmc2 = "indexes/kmc_can/{index2}_k31.kmc_pre"
    output:
        out = "output/inter/kmc_can/{index1}:{index2}.kmc_pre",
        res = "results/inter/kmc_can/{index1}:{index2}.txt"
    shell:
        "mkdir -p results/inter/kmc_can && for loop in {{0..9}}; do ( time ./utils/kmc/bin/kmc_tools -t1 simple ./indexes/kmc_can/{wildcards.index1}_k31 ./indexes/kmc_can/{wildcards.index2}_k31 intersect output/inter/kmc_can/{wildcards.index1}:{wildcards.index2} ) 2>> {output.res}; done"

rule inter_kmc_noncan:
    input:
        kmc1 = "indexes/kmc_noncan/{index1}_k31.kmc_pre",
        kmc2 = "indexes/kmc_noncan/{index2}_k31.kmc_pre"
    output:
        out = "output/inter/kmc_noncan/{index1}:{index2}.kmc_pre",
        res = "results/inter/kmc_noncan/{index1}:{index2}.txt"
    shell:
        "mkdir -p results/inter/kmc_noncan && for loop in {{0..9}}; do ( time ./utils/kmc/bin/kmc_tools -t1 simple ./indexes/kmc_noncan/{wildcards.index1}_k31 ./indexes/kmc_noncan/{wildcards.index2}_k31 intersect output/inter/kmc_noncan/{wildcards.index1}:{wildcards.index2} ) 2>> {output.res}; done"


### RAM SINGLE QUERIES

rule query_pos_sbwt_rc_ram:
    input:
        sbwt = "indexes/sbwt_rc/{sample}.sbwt",
        query = "queries/{sample}_pos.fa"
    output:
        out = "output/ram1/sbwt_rc/{sample}_pos.txt",
        res = "results/ram1/sbwt_rc/{sample}_pos.txt"
    shell:
        "for loop in {{0..9}}; do ( /usr/bin/time -v ./bench/sbwt-rs-cli/target/release/sbwt lookup -i {input.sbwt} -o {output.out} -q {input.query} -t 1 -b ) 2>> {output.res}; done"

rule query_neg_sbwt_rc_ram:
    input:
        sbwt = "indexes/sbwt_rc/{sample}.sbwt",
        query = "queries/{sample}_neg.fa"
    output:
        out = "output/ram1/sbwt_rc/{sample}_neg.txt",
        res = "results/ram1/sbwt_rc/{sample}_neg.txt"
    shell:
        "for loop in {{0..9}}; do ( /usr/bin/time -v ./bench/sbwt-rs-cli/target/release/sbwt lookup -i {input.sbwt} -o {output.out} -q {input.query} -t 1 -b ) 2>> {output.res}; done"

rule query_pos_sbwt_norc_ram:
    input:
        sbwt = "indexes/sbwt_norc/{sample}.sbwt",
        query = "queries/{sample}_pos.fa"
    output:
        out = "output/ram1/sbwt_norc/{sample}_pos.txt",
        res = "results/ram1/sbwt_norc/{sample}_pos.txt"
    shell:
        "for loop in {{0..9}}; do ( /usr/bin/time -v ./bench/sbwt-rs-cli/target/release/sbwt lookup -i {input.sbwt} -o {output.out} -q {input.query} -t 1 -b ) 2>> {output.res}; done"

rule query_neg_sbwt_norc_ram:
    input:
        sbwt = "indexes/sbwt_norc/{sample}.sbwt",
        query = "queries/{sample}_neg.fa"
    output:
        out = "output/ram1/sbwt_norc/{sample}_neg.txt",
        res = "results/ram1/sbwt_norc/{sample}_neg.txt"
    shell:
        "for loop in {{0..9}}; do ( /usr/bin/time -v ./bench/sbwt-rs-cli/target/release/sbwt lookup -i {input.sbwt} -o {output.out} -q {input.query} -t 1 -b ) 2>> {output.res}; done"

rule query_pos_bqf_ram_can:
    input:
        bqf = "indexes/bqf_can/{sample}.bqf",
        query = "queries/{sample}_pos.fa"
    output:
        out = "output/ram1/bqf_can/{sample}_pos.txt",
        res = "results/ram1/bqf_can/{sample}_pos.txt"
    shell:
        "for loop in {{0..9}}; do ( /usr/bin/time -v ./bench/bqf/build/bin/bqf query -b {input.bqf} -i {input.query} -o {output.out} ) 2>> {output.res}; done"

rule query_neg_bqf_ram_can:
    input:
        bqf = "indexes/bqf_can/{sample}.bqf",
        query = "queries/{sample}_neg.fa"
    output:
        out = "output/ram1/bqf_can/{sample}_neg.txt",
        res = "results/ram1/bqf_can/{sample}_neg.txt"
    shell:
        "for loop in {{0..9}}; do ( /usr/bin/time -v ./bench/bqf/build/bin/bqf query -b {input.bqf} -i {input.query} -o {output.out} ) 2>> {output.res}; done"

rule query_pos_bqf_ram_noncan:
    input:
        bqf = "indexes/bqf_noncan/{sample}.bqf",
        query = "queries/{sample}_pos.fa"
    output:
        out = "output/ram1/bqf_noncan/{sample}_pos.txt",
        res = "results/ram1/bqf_noncan/{sample}_pos.txt"
    shell:
        "for loop in {{0..9}}; do ( /usr/bin/time -v ./bench/bqf/build/bin/bqf query -b {input.bqf} -i {input.query} -o {output.out} ) 2>> {output.res}; done"

rule query_neg_bqf_ram:
    input:
        bqf = "indexes/bqf_noncan/{sample}.bqf",
        query = "queries/{sample}_neg.fa"
    output:
        out = "output/ram1/bqf_noncan/{sample}_neg.txt",
        res = "results/ram1/bqf_noncan/{sample}_neg.txt"
    shell:
        "for loop in {{0..9}}; do ( /usr/bin/time -v ./bench/bqf/build/bin/bqf query -b {input.bqf} -i {input.query} -o {output.out} ) 2>> {output.res}; done"

rule query_pos_sshash_can_ram:
    input:
        sshash = "indexes/sshash_can/{sample}.sshash",
        query = "queries/{sample}_pos.fa"
    output:
        "results/ram1/sshash_can/{sample}_pos.txt"
    shell:
        "for loop in {{0..9}}; do ( /usr/bin/time -v ./bench/sshash/build/sshash query -i {input.sshash} -q {input.query} ) 2>> {output}; done"

rule query_neg_sshash_can_ram:
    input:
        sshash = "indexes/sshash_can/{sample}.sshash",
        query = "queries/{sample}_neg.fa"
    output:
        "results/ram1/sshash_can/{sample}_neg.txt"
    shell:
        "for loop in {{0..9}}; do ( /usr/bin/time -v ./bench/sshash/build/sshash query -i {input.sshash} -q {input.query} ) 2>> {output}; done"

rule query_pos_sshash_noncan_ram:
    input:
        sshash = "indexes/sshash_noncan/{sample}.sshash",
        query = "queries/{sample}_pos.fa"
    output:
        "results/ram1/sshash_noncan/{sample}_pos.txt"
    shell:
        "for loop in {{0..9}}; do ( /usr/bin/time -v ./bench/sshash/build/sshash query -i {input.sshash} -q {input.query} ) 2>> {output}; done"

rule query_neg_sshash_noncan_ram:
    input:
        sshash = "indexes/sshash_noncan/{sample}.sshash",
        query = "queries/{sample}_neg.fa"
    output:
        "results/ram1/sshash_noncan/{sample}_neg.txt"
    shell:
        "for loop in {{0..9}}; do ( /usr/bin/time -v ./bench/sshash/build/sshash query -i {input.sshash} -q {input.query} ) 2>> {output}; done"

rule query_pos_sbb_ram:
    input:
        sbb = "indexes/sbb/{sample}.bf.zst",
        query = "queries/{sample}_pos.fa"
    output:
        "results/ram1/sbb/{sample}_pos.txt"
    shell:
        "mkdir -p ./output/ram1/sbb && for loop in {{0..9}}; do ( /usr/bin/time -v ./bench/SBB/target/release/sbb recruit -p output/ram1/sbb/{wildcards.sample}_pos -f {input.sbb} --fa {input.query} -t 1 ) 2>> {output}; done"

rule query_neg_sbb_ram:
    input:
        sbb = "indexes/sbb/{sample}.bf.zst",
        query = "queries/{sample}_neg.fa"
    output:
        "results/ram1/sbb/{sample}_neg.txt"
    shell:
        "mkdir -p ./output/ram1/sbb && for loop in {{0..9}}; do ( /usr/bin/time -v ./bench/SBB/target/release/sbb recruit -p output/ram1/sbb/{wildcards.sample}_neg -f {input.sbb} --fa {input.query} -t 1 ) 2>> {output}; done"
"""
rule query_pos_fmsi_same_ram:
    input:
        fmsi = "indexes/fmsi_same/{sample}.msfa.fmsi.ac",
        query = "queries/{sample}_pos.fa"
    output:
        "results/ram1/fmsi_same/{sample}_pos.txt"
    shell:
        "for loop in {{0..9}}; do ( /usr/bin/time -v ./bench/fmsi/fmsi query -q {input.query} -k 31 indexes/fmsi_same/{wildcards.sample}.msfa ) 2>> {output}; done"

rule query_neg_fmsi_same_ram:
    input:
        fmsi = "indexes/fmsi_same/{sample}.msfa.fmsi.ac",
        query = "queries/{sample}_neg.fa"
    output:
        "results/ram1/fmsi_same/{sample}_neg.txt"
    shell:
        "for loop in {{0..9}}; do ( /usr/bin/time -v ./bench/fmsi/fmsi query -q {input.query} -k 31 indexes/fmsi_same/{wildcards.sample}.msfa ) 2>> {output}; done"

rule query_pos_fmsi_dist_ram:
    input:
        fmsi = "indexes/fmsi_dist/{sample}.msfa.fmsi.ac",
        query = "queries/{sample}_pos.fa"
    output:
        "results/ram1/fmsi_dist/{sample}_pos.txt"
    shell:
        "for loop in {{0..9}}; do ( /usr/bin/time -v ./bench/fmsi/fmsi query -q {input.query} -k 31 indexes/fmsi_dist/{wildcards.sample}.msfa ) 2>> {output}; done"

rule query_neg_fmsi_dist_ram:
    input:
        fmsi = "indexes/fmsi_dist/{sample}.msfa.fmsi.ac",
        query = "queries/{sample}_neg.fa"
    output:
        "results/ram1/fmsi_dist/{sample}_neg.txt"
    shell:
        "for loop in {{0..9}}; do ( /usr/bin/time -v ./bench/fmsi/fmsi query -q {input.query} -k 31 indexes/fmsi_dist/{wildcards.sample}.msfa ) 2>> {output}; done"
"""
rule query_pos_cbl_ram:
    input:
        cbl = "indexes/cbl/{sample}.cbl",
        query = "queries/{sample}_pos.fa"
    output:
        "results/ram1/cbl/{sample}_pos.txt"
    shell:
        "for loop in {{0..9}}; do ( /usr/bin/time -v ./bench/cbl/cbl query {input.cbl} {input.query} ) 2>> {output}; done"

rule query_neg_cbl_ram:
    input:
        cbl = "indexes/cbl/{sample}.cbl",
        query = "queries/{sample}_neg.fa"
    output:
        "results/ram1/cbl/{sample}_neg.txt"
    shell:
        "for loop in {{0..9}}; do ( /usr/bin/time -v ./bench/cbl/cbl query {input.cbl} {input.query} ) 2>> {output}; done"

rule query_pos_swiss_ram:
    input:
        swiss = "indexes/swiss/{sample}.mp",
        query = "queries/{sample}_pos.fa"
    output:
        "results/ram1/swiss/{sample}_pos.txt"
    shell:
        "for loop in {{0..9}}; do ( /usr/bin/time -v ./bench/ST/cheesy_query/target/release/cheesy_query -k 31 -q {input.query} -i {input.swiss} ) 2>> {output}; done"

rule query_neg_swiss_ram:
    input:
        swiss = "indexes/swiss/{sample}.mp",
        query = "queries/{sample}_neg.fa"
    output:
        "results/ram1/swiss/{sample}_neg.txt"
    shell:
        "for loop in {{0..9}}; do ( /usr/bin/time -v ./bench/ST/cheesy_query/target/release/cheesy_query -k 31 -q {input.query} -i {input.swiss} ) 2>> {output}; done"

rule query_pos_kmindex_ram:
    input:
        chainer = "indexes/kmindex/{sample}_fof.txt",
        query = "queries/{sample}_pos.fa"
    output:
        "results/ram1/kmindex/{sample}_pos.txt"
    conda:
        "envs/kmindex.yaml"
    shell:
        "for loop in {{0..9}}; do ( /usr/bin/time -v kmindex query -i indexes/kmindex/{wildcards.sample}/ -z 6 -o output/ram1/kmindex/{wildcards.sample}_pos_$loop -q {input.query} -t 1 ) 2>> {output}; done"

rule query_neg_kmindex_ram:
    input:
        chainer = "indexes/kmindex/{sample}_fof.txt",
        query = "queries/{sample}_neg.fa"
    output:
        "results/ram1/kmindex/{sample}_neg.txt"
    conda:
        "envs/kmindex.yaml"
    shell:
        "for loop in {{0..9}}; do ( /usr/bin/time -v kmindex query -i indexes/kmindex/{wildcards.sample}/ -z 6 -o output/ram1/kmindex/{wildcards.sample}_neg_$loop -q {input.query} -t 1 ) 2>> {output}; done"

rule query_pos_fuze_ram:
    input:
        fuze = "indexes/fuze/{sample}.mp",
        query = "queries/{sample}_pos.fa"
    output:
        "results/ram1/fuze/{sample}_pos.txt"
    shell:
        "for loop in {{0..9}}; do ( /usr/bin/time -v ./bench/fuze/target/release/fuze query -k 31 -z 6 -i {input.fuze} -q {input.query} ) 2>> {output}; done"

rule query_neg_fuze_ram:
    input:
        fuze = "indexes/fuze/{sample}.mp",
        query = "queries/{sample}_neg.fa"
    output:
        "results/ram1/fuze/{sample}_neg.txt"
    shell:
        "for loop in {{0..9}}; do ( /usr/bin/time -v ./bench/fuze/target/release/fuze query -k 31 -z 6 -i {input.fuze} -q {input.query} ) 2>> {output}; done"

rule query_pos_sklib_ram:
    input:
        sklib = "indexes/sklib/{sample}.sk",
        query = "queries/{sample}_pos.fa"
    output:
        out = "output/ram1/sklib/{sample}_pos.txt",
        res = "results/ram1/sklib/{sample}_pos.txt"
    shell:
        "for loop in {{0..9}}; do ( /usr/bin/time -v ./bench/sklib/build/bin/sskm query -l {input.sklib} -i {input.query} -o {output.out} -t 1 ) 2>> {output.res}; done"

rule query_neg_sklib_ram:
    input:
        sklib = "indexes/sklib/{sample}.sk",
        query = "queries/{sample}_neg.fa"
    output:
        out = "output/ram1/sklib/{sample}_neg.txt",
        res = "results/ram1/sklib/{sample}_neg.txt"
    shell:
        "for loop in {{0..9}}; do ( /usr/bin/time -v ./bench/sklib/build/bin/sskm query -l {input.sklib} -i {input.query} -o {output.out} -t 1 ) 2>> {output.res}; done"  

### RAM STREAMING QUERIES

rule query_str_pos_sbwt_rc_ram:
    input:
        sbwt = "indexes/sbwt_rc/{sample}.sbwt",
        query = "queries/streaming/{sample}_pos.fa"
    output:
        out = "output/ramstr/sbwt_rc/{sample}_pos.txt",
        res = "results/ramstr/sbwt_rc/{sample}_pos.txt"
    shell:
        "for loop in {{0..9}}; do ( /usr/bin/time -v ./bench/sbwt-rs-cli/target/release/sbwt lookup -i {input.sbwt} -o {output.out} -q {input.query} -t 1 -b ) 2>> {output.res}; done"

rule query_str_neg_sbwt_rc_ram:
    input:
        sbwt = "indexes/sbwt_rc/{sample}.sbwt",
        query = "queries/streaming/{sample}_neg.fa"
    output:
        out = "output/ramstr/sbwt_rc/{sample}_neg.txt",
        res = "results/ramstr/sbwt_rc/{sample}_neg.txt"
    shell:
        "for loop in {{0..9}}; do ( /usr/bin/time -v ./bench/sbwt-rs-cli/target/release/sbwt lookup -i {input.sbwt} -o {output.out} -q {input.query} -t 1 -b ) 2>> {output.res}; done"

rule query_str_pos_sbwt_norc_ram:
    input:
        sbwt = "indexes/sbwt_norc/{sample}.sbwt",
        query = "queries/streaming/{sample}_pos.fa"
    output:
        out = "output/ramstr/sbwt_norc/{sample}_pos.txt",
        res = "results/ramstr/sbwt_norc/{sample}_pos.txt"
    shell:
        "for loop in {{0..9}}; do ( /usr/bin/time -v ./bench/sbwt-rs-cli/target/release/sbwt lookup -i {input.sbwt} -o {output.out} -q {input.query} -t 1 -b ) 2>> {output.res}; done"

rule query_str_neg_sbwt_norc_ram:
    input:
        sbwt = "indexes/sbwt_norc/{sample}.sbwt",
        query = "queries/streaming/{sample}_neg.fa"
    output:
        out = "output/ramstr/sbwt_norc/{sample}_neg.txt",
        res = "results/ramstr/sbwt_norc/{sample}_neg.txt"
    shell:
        "for loop in {{0..9}}; do ( /usr/bin/time -v ./bench/sbwt-rs-cli/target/release/sbwt lookup -i {input.sbwt} -o {output.out} -q {input.query} -t 1 -b ) 2>> {output.res}; done"

rule query_str_pos_bqf_can_ram:
    input:
        bqf = "indexes/bqf_can/{sample}.bqf",
        query = "queries/streaming/{sample}_pos.fa"
    output:
        out = "output/ramstr/bqf_can/{sample}_pos.txt",
        res = "results/ramstr/bqf_can/{sample}_pos.txt"
    shell:
        "for loop in {{0..9}}; do ( /usr/bin/time -v ./bench/bqf/build/bin/bqf query -b {input.bqf} -i {input.query} -o {output.out} ) 2>> {output.res}; done"

rule query_str_neg_bqf_can_ram:
    input:
        bqf = "indexes/bqf_can/{sample}.bqf",
        query = "queries/streaming/{sample}_neg.fa"
    output:
        out = "output/ramstr/bqf_can/{sample}_neg.txt",
        res = "results/ramstr/bqf_can/{sample}_neg.txt"
    shell:
        "for loop in {{0..9}}; do ( /usr/bin/time -v ./bench/bqf/build/bin/bqf query -b {input.bqf} -i {input.query} -o {output.out} ) 2>> {output.res}; done"

rule query_str_pos_bqf_noncan_ram:
    input:
        bqf = "indexes/bqf_noncan/{sample}.bqf",
        query = "queries/streaming/{sample}_pos.fa"
    output:
        out = "output/ramstr/bqf_noncan/{sample}_pos.txt",
        res = "results/ramstr/bqf_noncan/{sample}_pos.txt"
    shell:
        "for loop in {{0..9}}; do ( /usr/bin/time -v ./bench/bqf/build/bin/bqf query -b {input.bqf} -i {input.query} -o {output.out} ) 2>> {output.res}; done"

rule query_str_neg_bqf_noncan_ram:
    input:
        bqf = "indexes/bqf_noncan/{sample}.bqf",
        query = "queries/streaming/{sample}_neg.fa"
    output:
        out = "output/ramstr/bqf_noncan/{sample}_neg.txt",
        res = "results/ramstr/bqf_noncan/{sample}_neg.txt"
    shell:
        "for loop in {{0..9}}; do ( /usr/bin/time -v ./bench/bqf/build/bin/bqf query -b {input.bqf} -i {input.query} -o {output.out} ) 2>> {output.res}; done"

rule query_str_pos_sshash_can_ram:
    input:
        sshash = "indexes/sshash_can/{sample}.sshash",
        query = "queries/streaming/{sample}_pos.fa"
    output:
        "results/ramstr/sshash_can/{sample}_pos.txt"
    shell:
        "for loop in {{0..9}}; do ( /usr/bin/time -v ./bench/sshash/build/sshash query -i {input.sshash} -q {input.query} ) 2>> {output}; done"

rule query_str_neg_sshash_can_ram:
    input:
        sshash = "indexes/sshash_can/{sample}.sshash",
        query = "queries/streaming/{sample}_neg.fa"
    output:
        "results/ramstr/sshash_can/{sample}_neg.txt"
    shell:
        "for loop in {{0..9}}; do ( /usr/bin/time -v ./bench/sshash/build/sshash query -i {input.sshash} -q {input.query} ) 2>> {output}; done"

rule query_str_pos_sshash_noncan_ram:
    input:
        sshash = "indexes/sshash_noncan/{sample}.sshash",
        query = "queries/streaming/{sample}_pos.fa"
    output:
        "results/ramstr/sshash_noncan/{sample}_pos.txt"
    shell:
        "for loop in {{0..9}}; do ( /usr/bin/time -v ./bench/sshash/build/sshash query -i {input.sshash} -q {input.query} ) 2>> {output}; done"

rule query_str_neg_sshash_noncan_ram:
    input:
        sshash = "indexes/sshash_noncan/{sample}.sshash",
        query = "queries/streaming/{sample}_neg.fa"
    output:
        "results/ramstr/sshash_noncan/{sample}_neg.txt"
    shell:
        "for loop in {{0..9}}; do ( /usr/bin/time -v ./bench/sshash/build/sshash query -i {input.sshash} -q {input.query} ) 2>> {output}; done"

rule query_str_pos_sbb_ram:
    input:
        sbb = "indexes/sbb/{sample}.bf.zst",
        query = "queries/streaming/{sample}_pos.fa"
    output:
        "results/ramstr/sbb/{sample}_pos.txt"
    shell:
        "mkdir -p ./output/ramstr/sbb && for loop in {{0..9}}; do ( /usr/bin/time -v ./bench/SBB/target/release/sbb recruit -p output/ramstr/sbb/{wildcards.sample}_pos -f {input.sbb} --fa {input.query} -t 1 ) 2>> {output}; done"

rule query_str_neg_sbb_ram:
    input:
        sbb = "indexes/sbb/{sample}.bf.zst",
        query = "queries/streaming/{sample}_neg.fa"
    output:
        "results/ramstr/sbb/{sample}_neg.txt"
    shell:
        "mkdir -p ./output/ramstr/sbb && for loop in {{0..9}}; do ( /usr/bin/time -v ./bench/SBB/target/release/sbb recruit -p output/ramstr/sbb/{wildcards.sample}_neg -f {input.sbb} --fa {input.query} -t 1 ) 2>> {output}; done"
"""
rule query_str_pos_fmsi_same_ram:
    input:
        fmsi = "indexes/fmsi_same/{sample}.msfa.fmsi.ac",
        query = "queries/streaming/{sample}_pos.fa"
    output:
        "results/ramstr/fmsi_same/{sample}_pos.txt"
    shell:
        "for loop in {{0..9}}; do ( /usr/bin/time -v ./bench/fmsi/fmsi query -q {input.query} -k 31 indexes/fmsi_same/{wildcards.sample}.msfa ) 2>> {output}; done"

rule query_str_neg_fmsi_same_ram:
    input:
        fmsi = "indexes/fmsi_same/{sample}.msfa.fmsi.ac",
        query = "queries/streaming/{sample}_neg.fa"
    output:
        "results/ramstr/fmsi_same/{sample}_neg.txt"
    shell:
        "for loop in {{0..9}}; do ( /usr/bin/time -v ./bench/fmsi/fmsi query -q {input.query} -k 31 indexes/fmsi_same/{wildcards.sample}.msfa ) 2>> {output}; done"

rule query_str_pos_fmsi_dist_ram:
    input:
        fmsi = "indexes/fmsi_dist/{sample}.msfa.fmsi.ac",
        query = "queries/streaming/{sample}_pos.fa"
    output:
        "results/ramstr/fmsi_dist/{sample}_pos.txt"
    shell:
        "for loop in {{0..9}}; do ( /usr/bin/time -v ./bench/fmsi/fmsi query -q {input.query} -k 31 indexes/fmsi_dist/{wildcards.sample}.msfa ) 2>> {output}; done"

rule query_str_neg_fmsi_dist_ram:
    input:
        fmsi = "indexes/fmsi_dist/{sample}.msfa.fmsi.ac",
        query = "queries/streaming/{sample}_neg.fa"
    output:
        "results/ramstr/fmsi_dist/{sample}_neg.txt"
    shell:
        "for loop in {{0..9}}; do ( /usr/bin/time -v ./bench/fmsi/fmsi query -q {input.query} -k 31 indexes/fmsi_dist/{wildcards.sample}.msfa ) 2>> {output}; done"
"""
rule query_str_pos_cbl_ram:
    input:
        cbl = "indexes/cbl/{sample}.cbl",
        query = "queries/streaming/{sample}_pos.fa"
    output:
        "results/ramstr/cbl/{sample}_pos.txt"
    shell:
        "for loop in {{0..9}}; do ( /usr/bin/time -v ./bench/cbl/cbl query {input.cbl} {input.query} ) 2>> {output}; done"

rule query_str_neg_cbl_ram:
    input:
        cbl = "indexes/cbl/{sample}.cbl",
        query = "queries/streaming/{sample}_neg.fa"
    output:
        "results/ramstr/cbl/{sample}_neg.txt"
    shell:
        "for loop in {{0..9}}; do ( /usr/bin/time -v ./bench/cbl/cbl query {input.cbl} {input.query} ) 2>> {output}; done"

rule query_str_pos_swiss_ram:
    input:
        swiss = "indexes/swiss/{sample}.mp",
        query = "queries/streaming/{sample}_pos.fa"
    output:
        "results/ramstr/swiss/{sample}_pos.txt"
    shell:
        "for loop in {{0..9}}; do ( /usr/bin/time -v ./bench/ST/cheesy_query/target/release/cheesy_query -k 31 -q {input.query} -i {input.swiss} ) 2>> {output}; done"

rule query_str_neg_swiss_ram:
    input:
        swiss = "indexes/swiss/{sample}.mp",
        query = "queries/streaming/{sample}_neg.fa"
    output:
        "results/ramstr/swiss/{sample}_neg.txt"
    shell:
        "for loop in {{0..9}}; do ( /usr/bin/time -v ./bench/ST/cheesy_query/target/release/cheesy_query -k 31 -q {input.query} -i {input.swiss} ) 2>> {output}; done"

rule query_str_pos_kmindex_ram:
    input:
        chainer = "indexes/kmindex/{sample}_fof.txt",
        query = "queries/streaming/{sample}_pos.fa"
    output:
        "results/ramstr/kmindex/{sample}_pos.txt"
    conda:
        "envs/kmindex.yaml"
    shell:
        "for loop in {{0..9}}; do ( /usr/bin/time -v kmindex query -i indexes/kmindex/{wildcards.sample}/ -z 6 -o output/ramstr/kmindex/{wildcards.sample}_pos_$loop -q {input.query} -t 1 ) 2>> {output}; done"

rule query_str_neg_kmindex_ram:
    input:
        chainer = "indexes/kmindex/{sample}_fof.txt",
        query = "queries/streaming/{sample}_neg.fa"
    output:
        "results/ramstr/kmindex/{sample}_neg.txt"
    conda:
        "envs/kmindex.yaml"
    shell:
        "for loop in {{0..9}}; do ( /usr/bin/time -v kmindex query -i indexes/kmindex/{wildcards.sample}/ -z 6 -o output/ramstr/kmindex/{wildcards.sample}_neg_$loop -q {input.query} -t 1 ) 2>> {output}; done"

rule query_str_pos_fuze_ram:
    input:
        fuze = "indexes/fuze/{sample}.mp",
        query = "queries/streaming/{sample}_pos.fa"
    output:
        "results/ramstr/fuze/{sample}_pos.txt"
    shell:
        "for loop in {{0..9}}; do ( /usr/bin/time -v ./bench/fuze/target/release/fuze query -k 31 -z 6 -i {input.fuze} -q {input.query} ) 2>> {output}; done"

rule query_str_neg_fuze_ram:
    input:
        fuze = "indexes/fuze/{sample}.mp",
        query = "queries/streaming/{sample}_neg.fa"
    output:
        "results/ramstr/fuze/{sample}_neg.txt"
    shell:
        "for loop in {{0..9}}; do ( /usr/bin/time -v ./bench/fuze/target/release/fuze query -k 31 -z 6 -i {input.fuze} -q {input.query} ) 2>> {output}; done"

rule query_str_pos_sklib_ram:
    input:
        sklib = "indexes/sklib/{sample}.sk",
        query = "queries/streaming/{sample}_pos.fa"
    output:
        out = "output/ramstr/sklib/{sample}_pos.txt",
        res = "results/ramstr/sklib/{sample}_pos.txt"
    shell:
        "for loop in {{0..9}}; do ( /usr/bin/time -v ./bench/sklib/build/bin/sskm query -l {input.sklib} -i {input.query} -o {output.out} -t 1 ) 2>> {output.res}; done"

rule query_str_neg_sklib_ram:
    input:
        sklib = "indexes/sklib/{sample}.sk",
        query = "queries/streaming/{sample}_neg.fa"
    output:
        out = "output/ramstr/sklib/{sample}_neg.txt",
        res = "results/ramstr/sklib/{sample}_neg.txt"
    shell:
        "for loop in {{0..9}}; do ( /usr/bin/time -v ./bench/sklib/build/bin/sskm query -l {input.sklib} -i {input.query} -o {output.out} -t 1 ) 2>> {output.res}; done"  

### RAM INTERSECTIONS

rule inter_sbwt_rc_ram:
    input:
        sbwt1 = "indexes/sbwt_rc/{index1}.sbwt",
        sbwt2 = "indexes/sbwt_rc/{index2}.sbwt"
    output:
        out = "output/raminter/sbwt_rc/{index1}:{index2}.sbwt",
        res = "results/raminter/sbwt_rc/{index1}:{index2}.txt"
    shell:
        "for loop in {{0..9}}; do ( /usr/bin/time -v ./bench/sbwt-rs-cli/target/release/sbwt intersect -t 1 -o output/raminter/sbwt_rc/{wildcards.index1}:{wildcards.index2}.sbwt {input.sbwt1} {input.sbwt2} ) 2>> {output.res}; done"

rule inter_sbwt_norc_ram:
    input:
        sbwt1 = "indexes/sbwt_norc/{index1}.sbwt",
        sbwt2 = "indexes/sbwt_norc/{index2}.sbwt"
    output:
        out = "output/raminter/sbwt_norc/{index1}:{index2}.sbwt",
        res = "results/raminter/sbwt_norc/{index1}:{index2}.txt"
    shell:
        "for loop in {{0..9}}; do ( /usr/bin/time -v ./bench/sbwt-rs-cli/target/release/sbwt intersect -t 1 -o output/raminter/sbwt_norc/{wildcards.index1}:{wildcards.index2}.sbwt {input.sbwt1} {input.sbwt2} ) 2>> {output.res}; done"

rule inter_cbl_ram:
    input:
        cbl1 = "indexes/cbl/{index1}.cbl",
        cbl2 = "indexes/cbl/{index2}.cbl"
    output:
        out = "output/raminter/cbl/{index1}:{index2}.cbl",
        res = "results/raminter/cbl/{index1}:{index2}.txt"
    shell:
        "for loop in {{0..9}}; do ( /usr/bin/time -v ./bench/cbl/cbl inter -o {output.out} {input.cbl1} {input.cbl2} ) 2>> {output.res}; done"

rule inter_fmsi_ram:
    input:
        fmsi1 = "indexes/fmsi/{index1}.msfa",
        fmsi2 = "indexes/fmsi/{index2}.msfa"
    output:
        out = "output/raminter/fmsi/{index1}:{index2}.fmsi.ac",
        res = "results/raminter/fmsi/{index1}:{index2}.txt"
    shell:
        "for loop in {{0..9}}; do ( /usr/bin/time -v ./bench/fmsi/fmsi inter -r output/raminter/fmsi/{wildcards.index1}:{wildcards.index2} -p {input.fmsi1} -p {input.fmsi2} -k 31 ) 2>> {output.res}; done"
"""
rule inter_fmsi_dist_ram:
    input:
        fmsi1 = "indexes/fmsi_dist/{index1}.msfa",
        fmsi2 = "indexes/fmsi_dist/{index2}.msfa"
    output:
        out = "output/raminter/fmsi_dist/{index1}:{index2}.fmsi.ac",
        res = "results/raminter/fmsi_dist/{index1}:{index2}.txt"
    shell:
        "for loop in {{0..9}}; do ( /usr/bin/time -v ./bench/fmsi/fmsi inter -r output/raminter/fmsi_dist/{wildcards.index1}:{wildcards.index2} -p {input.fmsi1} -p {input.fmsi2} -k 31 ) 2>> {output.res}; done"
"""
rule inter_sklib_ram:
    input:
        skl1 = "indexes/sklib/{index1}.sk",
        skl2 = "indexes/sklib/{index2}.sk"
    output:
        out = "output/raminter/sklib/{index1}:{index2}.sk",
        res = "results/raminter/sklib/{index1}:{index2}.txt"
    shell:
        "for loop in {{0..9}}; do ( /usr/bin/time -v ./bench/sklib/build/bin/sskm setop -o {output.out} -a {input.skl1} -b {input.skl2} --op intersection ) 2>> {output.res}; done"

rule inter_kmc_ram_can:
    input:
        kmc1 = "indexes/kmc_can/{index1}_k31.kmc_pre",
        kmc2 = "indexes/kmc_can/{index2}_k31.kmc_pre"
    output:
        out = "output/raminter/kmc_can/{index1}:{index2}.kmc_pre",
        res = "results/raminter/kmc_can/{index1}:{index2}.txt"
    shell:
        "mkdir -p results/raminter/kmc_can && for loop in {{0..9}}; do ( /usr/bin/time -v ./utils/kmc/bin/kmc_tools -t1 simple ./indexes/kmc_can/{wildcards.index1}_k31 ./indexes/kmc_can/{wildcards.index2}_k31 intersect output/raminter/kmc_can/{wildcards.index1}:{wildcards.index2} ) 2>> {output.res}; done"

rule inter_kmc_ram_noncan:
    input:
        kmc1 = "indexes/kmc_noncan/{index1}_k31.kmc_pre",
        kmc2 = "indexes/kmc_noncan/{index2}_k31.kmc_pre"
    output:
        out = "output/raminter/kmc_noncan/{index1}:{index2}.kmc_pre",
        res = "results/raminter/kmc_noncan/{index1}:{index2}.txt"
    shell:
        "mkdir -p results/raminter/kmc_noncan && for loop in {{0..9}}; do ( /usr/bin/time -v ./utils/kmc/bin/kmc_tools -t1 simple ./indexes/kmc_noncan/{wildcards.index1}_k31 ./indexes/kmc_noncan/{wildcards.index2}_k31 intersect output/raminter/kmc_noncan/{wildcards.index1}:{wildcards.index2} ) 2>> {output.res}; done"

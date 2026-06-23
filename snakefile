DATASETS = ["SAMD00000345-Mesorhizobium_sp", "SAMD00000550-Corynebacterium_glutamicum", "SAMD00000344-Mesorhizobium_sp", "SAMD00000355-Mesorhizobium_sp", "SAMD00000552-Corynebacterium_glutamicum"]
COMBINATIONS = ["SAMD00000344-Mesorhizobium_sp:SAMD00000345-Mesorhizobium_sp", "SAMD00000344-Mesorhizobium_sp:SAMD00000355-Mesorhizobium_sp", "SAMD00000344-Mesorhizobium_sp:SAMD00000550-Corynebacterium_glutamicum", "SAMD00000344-Mesorhizobium_sp:SAMD00000552-Corynebacterium_glutamicum", "SAMD00000345-Mesorhizobium_sp:SAMD00000355-Mesorhizobium_sp", "SAMD00000345-Mesorhizobium_sp:SAMD00000550-Corynebacterium_glutamicum", "SAMD00000345-Mesorhizobium_sp:SAMD00000552-Corynebacterium_glutamicum", "SAMD00000355-Mesorhizobium_sp:SAMD00000550-Corynebacterium_glutamicum", "SAMD00000355-Mesorhizobium_sp:SAMD00000552-Corynebacterium_glutamicum", "SAMD00000550-Corynebacterium_glutamicum:SAMD00000552-Corynebacterium_glutamicum"]


rule all:
    input:
        expand("arrows/{dataset}.arrow", dataset = DATASETS),
        expand("parsed_genomes/{dataset}_k31.fa", dataset = DATASETS),
        expand("eulertigs/{dataset}_k31_e.fa", dataset = DATASETS),
        expand("indexes/sbwt/{dataset}.sbwt", dataset = DATASETS),
        expand("indexes/sbwt/{dataset}.lcs", dataset = DATASETS),
        expand("kmc/{dataset}_k25.kmc_pre", dataset = DATASETS),
        expand("indexes/bqf/{dataset}.bqf", dataset = DATASETS),
        expand("indexes/sshash/{dataset}.sshash", dataset = DATASETS),
        expand("indexes/sbb/{dataset}.bf.zst", dataset = DATASETS),
        expand("indexes/fmsi/{dataset}.msfa", dataset = DATASETS),
        expand("indexes/fmsi/{dataset}.msfa.fmsi.ac", dataset = DATASETS),
        expand("indexes/cbl/{dataset}.cbl", dataset = DATASETS),
        expand("indexes/fuze/{dataset}.mp", dataset = DATASETS),
        expand("indexes/swiss/{dataset}.mp", dataset = DATASETS),
        expand("indexes/kmindex/{dataset}_fof.txt", dataset = DATASETS),
        expand("indexes/sklib/{dataset}.sk", dataset = DATASETS),
        expand("indexes/kmc/{dataset}_k31.kmc_pre", dataset = DATASETS),
        expand("queries/{dataset}_pos.fa", dataset = DATASETS),
        expand("queries/{dataset}_neg.fa", dataset = DATASETS),
        expand("queries/streaming/{dataset}_pos.fa", dataset = DATASETS),
        expand("queries/streaming/{dataset}_neg.fa", dataset = DATASETS),
        expand("results/1/sbwt/{dataset}_pos.txt", dataset = DATASETS),
        expand("results/1/sbwt/{dataset}_neg.txt", dataset = DATASETS),
        expand("results/1/bqf/{dataset}_pos.txt", dataset = DATASETS),
        expand("results/1/bqf/{dataset}_neg.txt", dataset = DATASETS),
        expand("results/1/sshash/{dataset}_pos.txt", dataset = DATASETS),
        expand("results/1/sshash/{dataset}_neg.txt", dataset = DATASETS),
        expand("results/1/sbb/{dataset}_pos.txt", dataset = DATASETS),
        expand("results/1/sbb/{dataset}_neg.txt", dataset = DATASETS),
        expand("results/1/fmsi/{dataset}_pos.txt", dataset = DATASETS),
        expand("results/1/fmsi/{dataset}_neg.txt", dataset = DATASETS),
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
        expand("results/str/sbwt/{dataset}_pos.txt", dataset = DATASETS),
        expand("results/str/sbwt/{dataset}_neg.txt", dataset = DATASETS),
        expand("results/str/bqf/{dataset}_pos.txt", dataset = DATASETS),
        expand("results/str/bqf/{dataset}_neg.txt", dataset = DATASETS),
        expand("results/str/sshash/{dataset}_pos.txt", dataset = DATASETS),
        expand("results/str/sshash/{dataset}_neg.txt", dataset = DATASETS),
        expand("results/str/sbb/{dataset}_pos.txt", dataset = DATASETS),
        expand("results/str/sbb/{dataset}_neg.txt", dataset = DATASETS),
        expand("results/str/fmsi/{dataset}_pos.txt", dataset = DATASETS),
        expand("results/str/fmsi/{dataset}_neg.txt", dataset = DATASETS),
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
        expand("results/inter/sbwt/{combination}.txt", combination = COMBINATIONS),
        expand("results/inter/cbl/{combination}.txt", combination = COMBINATIONS),
        expand("results/inter/fmsi/{combination}.txt", combination = COMBINATIONS),
        expand("results/inter/sklib/{combination}.txt", combination = COMBINATIONS),
        expand("results/inter/kmc/{combination}.txt", combination = COMBINATIONS),
        expand("results/ram1/sbwt/{dataset}_pos.txt", dataset = DATASETS),
        expand("results/ram1/sbwt/{dataset}_neg.txt", dataset = DATASETS),
        expand("results/ram1/bqf/{dataset}_pos.txt", dataset = DATASETS),
        expand("results/ram1/bqf/{dataset}_neg.txt", dataset = DATASETS),
        expand("results/ram1/sshash/{dataset}_pos.txt", dataset = DATASETS),
        expand("results/ram1/sshash/{dataset}_neg.txt", dataset = DATASETS),
        expand("results/ram1/sbb/{dataset}_pos.txt", dataset = DATASETS),
        expand("results/ram1/sbb/{dataset}_neg.txt", dataset = DATASETS),
        expand("results/ram1/fmsi/{dataset}_pos.txt", dataset = DATASETS),
        expand("results/ram1/fmsi/{dataset}_neg.txt", dataset = DATASETS),
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
        expand("results/ramstr/sbwt/{dataset}_pos.txt", dataset = DATASETS),
        expand("results/ramstr/sbwt/{dataset}_neg.txt", dataset = DATASETS),
        expand("results/ramstr/bqf/{dataset}_pos.txt", dataset = DATASETS),
        expand("results/ramstr/bqf/{dataset}_neg.txt", dataset = DATASETS),
        expand("results/ramstr/sshash/{dataset}_pos.txt", dataset = DATASETS),
        expand("results/ramstr/sshash/{dataset}_neg.txt", dataset = DATASETS),
        expand("results/ramstr/sbb/{dataset}_pos.txt", dataset = DATASETS),
        expand("results/ramstr/sbb/{dataset}_neg.txt", dataset = DATASETS),
        expand("results/ramstr/fmsi/{dataset}_pos.txt", dataset = DATASETS),
        expand("results/ramstr/fmsi/{dataset}_neg.txt", dataset = DATASETS),
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
        expand("results/raminter/sbwt/{combination}.txt", combination = COMBINATIONS),
        expand("results/raminter/cbl/{combination}.txt", combination = COMBINATIONS),
        expand("results/raminter/fmsi/{combination}.txt", combination = COMBINATIONS),
        expand("results/raminter/sklib/{combination}.txt", combination = COMBINATIONS),
        expand("results/raminter/kmc/{combination}.txt", combination = COMBINATIONS)
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

rule index_sbwt:
    input:
        "eulertigs/{sample}_k31_e.fa"
    output:
        "indexes/sbwt/{sample}.sbwt",
        "indexes/sbwt/{sample}.lcs"
    shell:
        "./bench/sbwt-rs-cli/target/release/sbwt build -l -r -i {input} -o indexes/sbwt/{wildcards.sample} -k 31"

rule kmc:
    input:
        "eulertigs/{sample}_k31_e.fa"
    output:
        "kmc/{sample}_k25.kmc_pre",
        "kmc/{sample}_k25.kmc_suf",
    shell:
        "mkdir kmc/{wildcards.sample} && ./utils/kmc/bin/kmc -fm -k25 -ci1 {input} kmc/{wildcards.sample}_k25 kmc/{wildcards.sample}"

rule index_bqf:
    input:
        "kmc/{sample}_k25.kmc_pre",
        "kmc/{sample}_k25.kmc_suf",
    output:
        "indexes/bqf/{sample}.bqf"
    shell:
        "./bench/bqf/build/bin/bqf build -i kmc/{wildcards.sample}_k25 -o {output} -k 31 -z 16"

rule index_sshash:
    input:
        "eulertigs/{sample}_k31_e.fa"
    output:
        "indexes/sshash/{sample}.sshash"
    shell:
        "./bench/sshash/build/sshash build -i {input} -k 31 -m 10 -o {output} --canonical"

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

rule index_fmsi:
    input:
        "indexes/fmsi/{sample}.msfa"
    output:
        "indexes/fmsi/{sample}.msfa.fmsi.ac"
    shell:
        "./bench/fmsi/fmsi index -k 31 {input}"

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

rule index_kmc:
    input:
        "eulertigs/{sample}_k31_e.fa"
    output:
        "indexes/kmc/{sample}_k31.kmc_pre",
        "indexes/kmc/{sample}_k31.kmc_suf"
    shell:
        "mkdir -p indexes/kmc/{wildcards.sample} && ./utils/kmc/bin/kmc -fm -k31 -ci1 {input} indexes/kmc/{wildcards.sample}_k31 indexes/kmc/{wildcards.sample}"
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

rule query_pos_sbwt:
    input:
        sbwt = "indexes/sbwt/{sample}.sbwt",
        query = "queries/{sample}_pos.fa"
    output:
        out = "output/1/sbwt/{sample}_pos.txt",
        res = "results/1/sbwt/{sample}_pos.txt"
    shell:
        "for loop in {{0..9}}; do ( time ./bench/sbwt-rs-cli/target/release/sbwt lookup -i {input.sbwt} -o {output.out} -q {input.query} -t 1 -b ) 2>> {output.res}; done"

rule query_neg_sbwt:
    input:
        sbwt = "indexes/sbwt/{sample}.sbwt",
        query = "queries/{sample}_neg.fa"
    output:
        out = "output/1/sbwt/{sample}_neg.txt",
        res = "results/1/sbwt/{sample}_neg.txt"
    shell:
        "for loop in {{0..9}}; do ( time ./bench/sbwt-rs-cli/target/release/sbwt lookup -i {input.sbwt} -o {output.out} -q {input.query} -t 1 -b ) 2>> {output.res}; done"

rule query_pos_bqf:
    input:
        bqf = "indexes/bqf/{sample}.bqf",
        query = "queries/{sample}_pos.fa"
    output:
        out = "output/1/bqf/{sample}_pos.txt",
        res = "results/1/bqf/{sample}_pos.txt"
    shell:
        "for loop in {{0..9}}; do ( time ./bench/bqf/build/bin/bqf query -b {input.bqf} -i {input.query} -o {output.out} ) 2>> {output.res}; done"

rule query_neg_bqf:
    input:
        bqf = "indexes/bqf/{sample}.bqf",
        query = "queries/{sample}_neg.fa"
    output:
        out = "output/1/bqf/{sample}_neg.txt",
        res = "results/1/bqf/{sample}_neg.txt"
    shell:
        "for loop in {{0..9}}; do ( time ./bench/bqf/build/bin/bqf query -b {input.bqf} -i {input.query} -o {output.out} ) 2>> {output.res}; done"

rule query_pos_sshash:
    input:
        sshash = "indexes/sshash/{sample}.sshash",
        query = "queries/{sample}_pos.fa"
    output:
        "results/1/sshash/{sample}_pos.txt"
    shell:
        "for loop in {{0..9}}; do ( time ./bench/sshash/build/sshash query -i {input.sshash} -q {input.query} ) 2>> {output}; done"

rule query_neg_sshash:
    input:
        sshash = "indexes/sshash/{sample}.sshash",
        query = "queries/{sample}_neg.fa"
    output:
        "results/1/sshash/{sample}_neg.txt"
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

rule query_pos_fmsi:
    input:
        fmsi = "indexes/fmsi/{sample}.msfa.fmsi.ac",
        query = "queries/{sample}_pos.fa"
    output:
        "results/1/fmsi/{sample}_pos.txt"
    shell:
        "for loop in {{0..9}}; do ( time ./bench/fmsi/fmsi query -q {input.query} -k 31 indexes/fmsi/{wildcards.sample}.msfa ) 2>> {output}; done"

rule query_neg_fmsi:
    input:
        fmsi = "indexes/fmsi/{sample}.msfa.fmsi.ac",
        query = "queries/{sample}_neg.fa"
    output:
        "results/1/fmsi/{sample}_neg.txt"
    shell:
        "for loop in {{0..9}}; do ( time ./bench/fmsi/fmsi query -q {input.query} -k 31 indexes/fmsi/{wildcards.sample}.msfa ) 2>> {output}; done"

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

rule query_str_pos_sbwt:
    input:
        sbwt = "indexes/sbwt/{sample}.sbwt",
        query = "queries/streaming/{sample}_pos.fa"
    output:
        out = "output/str/sbwt/{sample}_pos.txt",
        res = "results/str/sbwt/{sample}_pos.txt"
    shell:
        "for loop in {{0..9}}; do ( time ./bench/sbwt-rs-cli/target/release/sbwt lookup -i {input.sbwt} -o {output.out} -q {input.query} -t 1 -b ) 2>> {output.res}; done"

rule query_str_neg_sbwt:
    input:
        sbwt = "indexes/sbwt/{sample}.sbwt",
        query = "queries/streaming/{sample}_neg.fa"
    output:
        out = "output/str/sbwt/{sample}_neg.txt",
        res = "results/str/sbwt/{sample}_neg.txt"
    shell:
        "for loop in {{0..9}}; do ( time ./bench/sbwt-rs-cli/target/release/sbwt lookup -i {input.sbwt} -o {output.out} -q {input.query} -t 1 -b ) 2>> {output.res}; done"

rule query_str_pos_bqf:
    input:
        bqf = "indexes/bqf/{sample}.bqf",
        query = "queries/streaming/{sample}_pos.fa"
    output:
        out = "output/str/bqf/{sample}_pos.txt",
        res = "results/str/bqf/{sample}_pos.txt"
    shell:
        "for loop in {{0..9}}; do ( time ./bench/bqf/build/bin/bqf query -b {input.bqf} -i {input.query} -o {output.out} ) 2>> {output.res}; done"

rule query_str_neg_bqf:
    input:
        bqf = "indexes/bqf/{sample}.bqf",
        query = "queries/streaming/{sample}_neg.fa"
    output:
        out = "output/str/bqf/{sample}_neg.txt",
        res = "results/str/bqf/{sample}_neg.txt"
    shell:
        "for loop in {{0..9}}; do ( time ./bench/bqf/build/bin/bqf query -b {input.bqf} -i {input.query} -o {output.out} ) 2>> {output.res}; done"

rule query_str_pos_sshash:
    input:
        sshash = "indexes/sshash/{sample}.sshash",
        query = "queries/streaming/{sample}_pos.fa"
    output:
        "results/str/sshash/{sample}_pos.txt"
    shell:
        "for loop in {{0..9}}; do ( time ./bench/sshash/build/sshash query -i {input.sshash} -q {input.query} ) 2>> {output}; done"

rule query_str_neg_sshash:
    input:
        sshash = "indexes/sshash/{sample}.sshash",
        query = "queries/streaming/{sample}_neg.fa"
    output:
        "results/str/sshash/{sample}_neg.txt"
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

rule query_str_pos_fmsi:
    input:
        fmsi = "indexes/fmsi/{sample}.msfa.fmsi.ac",
        query = "queries/streaming/{sample}_pos.fa"
    output:
        "results/str/fmsi/{sample}_pos.txt"
    shell:
        "for loop in {{0..9}}; do ( time ./bench/fmsi/fmsi query -q {input.query} -k 31 indexes/fmsi/{wildcards.sample}.msfa ) 2>> {output}; done"

rule query_str_neg_fmsi:
    input:
        fmsi = "indexes/fmsi/{sample}.msfa.fmsi.ac",
        query = "queries/streaming/{sample}_neg.fa"
    output:
        "results/str/fmsi/{sample}_neg.txt"
    shell:
        "for loop in {{0..9}}; do ( time ./bench/fmsi/fmsi query -q {input.query} -k 31 indexes/fmsi/{wildcards.sample}.msfa ) 2>> {output}; done"

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

rule inter_sbwt:
    input:
        sbwt1 = "indexes/sbwt/{index1}.sbwt",
        sbwt2 = "indexes/sbwt/{index2}.sbwt"
    output:
        out = "output/inter/sbwt/{index1}:{index2}.sbwt",
        res = "results/inter/sbwt/{index1}:{index2}.txt"
    shell:
        "for loop in {{0..9}}; do ( time ./bench/sbwt-rs-cli/target/release/sbwt intersect -t 1 -o output/inter/sbwt/{wildcards.index1}:{wildcards.index2}.sbwt {input.sbwt1} {input.sbwt2} ) 2>> {output.res}; done"

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

rule inter_sklib:
    input:
        skl1 = "indexes/sklib/{index1}.sk",
        skl2 = "indexes/sklib/{index2}.sk"
    output:
        out = "output/inter/sklib/{index1}:{index2}.sk",
        res = "results/inter/sklib/{index1}:{index2}.txt"
    shell:
        "for loop in {{0..9}}; do ( time ./bench/sklib/build/bin/sskm setop -o {output.out} -a {input.skl1} -b {input.skl2} --op intersection ) 2>> {output.res}; done"

rule inter_kmc:
    input:
        kmc1 = "indexes/kmc/{index1}_k31.kmc_pre",
        kmc2 = "indexes/kmc/{index2}_k31.kmc_pre"
    output:
        out = "output/inter/kmc/{index1}:{index2}.kmc_pre",
        res = "results/inter/kmc/{index1}:{index2}.txt"
    shell:
        "mkdir -p results/inter/kmc && for loop in {{0..9}}; do ( time ./utils/kmc/bin/kmc_tools -t1 simple ./indexes/kmc/{wildcards.index1}_k31 ./indexes/kmc/{wildcards.index2}_k31 intersect output/inter/kmc/{wildcards.index1}:{wildcards.index2} ) 2>> {output.res}; done"

rule query_pos_sbwt_ram:
    input:
        sbwt = "indexes/sbwt/{sample}.sbwt",
        query = "queries/{sample}_pos.fa"
    output:
        out = "output/ram1/sbwt/{sample}_pos.txt",
        res = "results/ram1/sbwt/{sample}_pos.txt"
    shell:
        "for loop in {{0..9}}; do ( /usr/bin/time -v ./bench/sbwt-rs-cli/target/release/sbwt lookup -i {input.sbwt} -o {output.out} -q {input.query} -t 1 -b ) 2>> {output.res}; done"

rule query_neg_sbwt_ram:
    input:
        sbwt = "indexes/sbwt/{sample}.sbwt",
        query = "queries/{sample}_neg.fa"
    output:
        out = "output/ram1/sbwt/{sample}_neg.txt",
        res = "results/ram1/sbwt/{sample}_neg.txt"
    shell:
        "for loop in {{0..9}}; do ( /usr/bin/time -v ./bench/sbwt-rs-cli/target/release/sbwt lookup -i {input.sbwt} -o {output.out} -q {input.query} -t 1 -b ) 2>> {output.res}; done"

rule query_pos_bqf_ram:
    input:
        bqf = "indexes/bqf/{sample}.bqf",
        query = "queries/{sample}_pos.fa"
    output:
        out = "output/ram1/bqf/{sample}_pos.txt",
        res = "results/ram1/bqf/{sample}_pos.txt"
    shell:
        "for loop in {{0..9}}; do ( /usr/bin/time -v ./bench/bqf/build/bin/bqf query -b {input.bqf} -i {input.query} -o {output.out} ) 2>> {output.res}; done"

rule query_neg_bqf_ram:
    input:
        bqf = "indexes/bqf/{sample}.bqf",
        query = "queries/{sample}_neg.fa"
    output:
        out = "output/ram1/bqf/{sample}_neg.txt",
        res = "results/ram1/bqf/{sample}_neg.txt"
    shell:
        "for loop in {{0..9}}; do ( /usr/bin/time -v ./bench/bqf/build/bin/bqf query -b {input.bqf} -i {input.query} -o {output.out} ) 2>> {output.res}; done"

rule query_pos_sshash_ram:
    input:
        sshash = "indexes/sshash/{sample}.sshash",
        query = "queries/{sample}_pos.fa"
    output:
        "results/ram1/sshash/{sample}_pos.txt"
    shell:
        "for loop in {{0..9}}; do ( /usr/bin/time -v ./bench/sshash/build/sshash query -i {input.sshash} -q {input.query} ) 2>> {output}; done"

rule query_neg_sshash_ram:
    input:
        sshash = "indexes/sshash/{sample}.sshash",
        query = "queries/{sample}_neg.fa"
    output:
        "results/ram1/sshash/{sample}_neg.txt"
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

rule query_pos_fmsi_ram:
    input:
        fmsi = "indexes/fmsi/{sample}.msfa.fmsi.ac",
        query = "queries/{sample}_pos.fa"
    output:
        "results/ram1/fmsi/{sample}_pos.txt"
    shell:
        "for loop in {{0..9}}; do ( /usr/bin/time -v ./bench/fmsi/fmsi query -q {input.query} -k 31 indexes/fmsi/{wildcards.sample}.msfa ) 2>> {output}; done"

rule query_neg_fmsi_ram:
    input:
        fmsi = "indexes/fmsi/{sample}.msfa.fmsi.ac",
        query = "queries/{sample}_neg.fa"
    output:
        "results/ram1/fmsi/{sample}_neg.txt"
    shell:
        "for loop in {{0..9}}; do ( /usr/bin/time -v ./bench/fmsi/fmsi query -q {input.query} -k 31 indexes/fmsi/{wildcards.sample}.msfa ) 2>> {output}; done"

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


rule query_str_pos_sbwt_ram:
    input:
        sbwt = "indexes/sbwt/{sample}.sbwt",
        query = "queries/streaming/{sample}_pos.fa"
    output:
        out = "output/ramstr/sbwt/{sample}_pos.txt",
        res = "results/ramstr/sbwt/{sample}_pos.txt"
    shell:
        "for loop in {{0..9}}; do ( /usr/bin/time -v ./bench/sbwt-rs-cli/target/release/sbwt lookup -i {input.sbwt} -o {output.out} -q {input.query} -t 1 -b ) 2>> {output.res}; done"

rule query_str_neg_sbwt_ram:
    input:
        sbwt = "indexes/sbwt/{sample}.sbwt",
        query = "queries/streaming/{sample}_neg.fa"
    output:
        out = "output/ramstr/sbwt/{sample}_neg.txt",
        res = "results/ramstr/sbwt/{sample}_neg.txt"
    shell:
        "for loop in {{0..9}}; do ( /usr/bin/time -v ./bench/sbwt-rs-cli/target/release/sbwt lookup -i {input.sbwt} -o {output.out} -q {input.query} -t 1 -b ) 2>> {output.res}; done"

rule query_str_pos_bqf_ram:
    input:
        bqf = "indexes/bqf/{sample}.bqf",
        query = "queries/streaming/{sample}_pos.fa"
    output:
        out = "output/ramstr/bqf/{sample}_pos.txt",
        res = "results/ramstr/bqf/{sample}_pos.txt"
    shell:
        "for loop in {{0..9}}; do ( /usr/bin/time -v ./bench/bqf/build/bin/bqf query -b {input.bqf} -i {input.query} -o {output.out} ) 2>> {output.res}; done"

rule query_str_neg_bqf_ram:
    input:
        bqf = "indexes/bqf/{sample}.bqf",
        query = "queries/streaming/{sample}_neg.fa"
    output:
        out = "output/ramstr/bqf/{sample}_neg.txt",
        res = "results/ramstr/bqf/{sample}_neg.txt"
    shell:
        "for loop in {{0..9}}; do ( /usr/bin/time -v ./bench/bqf/build/bin/bqf query -b {input.bqf} -i {input.query} -o {output.out} ) 2>> {output.res}; done"

rule query_str_pos_sshash_ram:
    input:
        sshash = "indexes/sshash/{sample}.sshash",
        query = "queries/streaming/{sample}_pos.fa"
    output:
        "results/ramstr/sshash/{sample}_pos.txt"
    shell:
        "for loop in {{0..9}}; do ( /usr/bin/time -v ./bench/sshash/build/sshash query -i {input.sshash} -q {input.query} ) 2>> {output}; done"

rule query_str_neg_sshash_ram:
    input:
        sshash = "indexes/sshash/{sample}.sshash",
        query = "queries/streaming/{sample}_neg.fa"
    output:
        "results/ramstr/sshash/{sample}_neg.txt"
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

rule query_str_pos_fmsi_ram:
    input:
        fmsi = "indexes/fmsi/{sample}.msfa.fmsi.ac",
        query = "queries/streaming/{sample}_pos.fa"
    output:
        "results/ramstr/fmsi/{sample}_pos.txt"
    shell:
        "for loop in {{0..9}}; do ( /usr/bin/time -v ./bench/fmsi/fmsi query -q {input.query} -k 31 indexes/fmsi/{wildcards.sample}.msfa ) 2>> {output}; done"

rule query_str_neg_fmsi_ram:
    input:
        fmsi = "indexes/fmsi/{sample}.msfa.fmsi.ac",
        query = "queries/streaming/{sample}_neg.fa"
    output:
        "results/ramstr/fmsi/{sample}_neg.txt"
    shell:
        "for loop in {{0..9}}; do ( /usr/bin/time -v ./bench/fmsi/fmsi query -q {input.query} -k 31 indexes/fmsi/{wildcards.sample}.msfa ) 2>> {output}; done"

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

rule inter_sbwt_ram:
    input:
        sbwt1 = "indexes/sbwt/{index1}.sbwt",
        sbwt2 = "indexes/sbwt/{index2}.sbwt"
    output:
        out = "output/raminter/sbwt/{index1}:{index2}.sbwt",
        res = "results/raminter/sbwt/{index1}:{index2}.txt"
    shell:
        "for loop in {{0..9}}; do ( /usr/bin/time -v ./bench/sbwt-rs-cli/target/release/sbwt intersect -t 1 -o output/raminter/sbwt/{wildcards.index1}:{wildcards.index2}.sbwt {input.sbwt1} {input.sbwt2} ) 2>> {output.res}; done"

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

rule inter_sklib_ram:
    input:
        skl1 = "indexes/sklib/{index1}.sk",
        skl2 = "indexes/sklib/{index2}.sk"
    output:
        out = "output/raminter/sklib/{index1}:{index2}.sk",
        res = "results/raminter/sklib/{index1}:{index2}.txt"
    shell:
        "for loop in {{0..9}}; do ( /usr/bin/time -v ./bench/sklib/build/bin/sskm setop -o {output.out} -a {input.skl1} -b {input.skl2} --op intersection ) 2>> {output.res}; done"

rule inter_kmc_ram:
    input:
        kmc1 = "indexes/kmc/{index1}_k31.kmc_pre",
        kmc2 = "indexes/kmc/{index2}_k31.kmc_pre"
    output:
        out = "output/raminter/kmc/{index1}:{index2}.kmc_pre",
        res = "results/raminter/kmc/{index1}:{index2}.txt"
    shell:
        "mkdir -p results/raminter/kmc && for loop in {{0..9}}; do ( /usr/bin/time -v ./utils/kmc/bin/kmc_tools -t1 simple ./indexes/kmc/{wildcards.index1}_k31 ./indexes/kmc/{wildcards.index2}_k31 intersect output/raminter/kmc/{wildcards.index1}:{wildcards.index2} ) 2>> {output.res}; done"

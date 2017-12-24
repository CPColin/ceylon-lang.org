import ceylon.time {
    Date,
    date
}
import ceylon.time.base {
    august,
    december,
    february,
    july,
    june,
    march,
    november,
    october,
    september
}

shared class Release(shared String name, shared String version, shared Date date,
    shared String releaseAnnouncement, shared ReleaseFile zipFile, shared ReleaseFile rpmFile,
    shared ReleaseFile debFile) {
    
    string = "Eclipse Ceylon ``version`` \"``name``\"";
}

shared class ReleaseFile(shared Integer size, shared String linkName, shared String fileName) {}

shared String currentDocumentationVersion = "1.3";

shared [Release+] releases = [
    Release {
        name = "Contents May Differ";
        version = "1.3.3";
        date = date(2017, august, 21);
        releaseAnnouncement = "/blog/2017/08/21/ceylon-1-3-3/";
        zipFile = ReleaseFile {
            size = 22228740;
            linkName = "1_3_3";
            fileName = "ceylon-1.3.3.zip";
        };
        rpmFile = ReleaseFile {
            size = 20844532;
            linkName = "1_3_3_rpm";
            fileName = "ceylon-1.3.3-1.3.3-0.noarch.rpm";
        };
        debFile = ReleaseFile {
            size = 20392050;
            linkName = "1_3_3_deb";
            fileName = "ceylon-1.3.3_1.3.3-0_all.deb";
        };
    },
    Release {
        name = "Smile Tolerantly";
        version = "1.3.2";
        date = date(2017, march, 2);
        releaseAnnouncement = "/blog/2017/03/03/ceylon-1-3-2/";
        zipFile = ReleaseFile {
            size = 22774620;
            linkName = "1_3_2";
            fileName = "ceylon-1.3.2.zip";
        };
        rpmFile = ReleaseFile {
            size = 21278416;
            linkName = "1_3_2_rpm";
            fileName = "ceylon-1.3.2-1.3.2-0.noarch.rpm";
        };
        debFile = ReleaseFile {
            size = 20864034;
            linkName = "1_3_2_deb";
            fileName = "ceylon-1.3.2_1.3.2-0_all.deb";
        };
    },
    Release {
        name = "Now We Try It My Way";
        version = "1.3.1";
        date = date(2016, november, 22);
        releaseAnnouncement = "/blog/2016/11/22/ceylon-1-3-1/";
        zipFile = ReleaseFile {
            size = 22494480;
            linkName = "1_3_1";
            fileName = "ceylon-1.3.1.zip";
        };
        rpmFile = ReleaseFile {
            size = 20985960;
            linkName = "1_3_1_rpm";
            fileName = "ceylon-1.3.1-1.3.1-1.noarch.rpm";
        };
        debFile = ReleaseFile {
            size = 20575990;
            linkName = "1_3_1_deb";
            fileName = "ceylon-1.3.1_1.3.1-1_all.deb";
        };
    },
    Release {
        name = "Total Internal Reflection";
        version = "1.3.0";
        date = date(2016, september, 19);
        releaseAnnouncement = "/blog/2016/09/19/ceylon-1-3-0/";
        zipFile = ReleaseFile {
            size = 22120919;
            linkName = "1_3_0";
            fileName = "ceylon-1.3.0.zip";
        };
        rpmFile = ReleaseFile {
            size = 20627056;
            linkName = "1_3_0_rpm";
            fileName = "ceylon-1.3.0-1.3.0-0.noarch.rpm";
        };
        debFile = ReleaseFile {
            size = 20226678;
            linkName = "1_3_0_deb";
            fileName = "ceylon-1.3.0_1.3.0_all.deb";
        };
    },
    Release {
        name = "Charming But Irrational";
        version = "1.2.2";
        date = date(2016, march, 11);
        releaseAnnouncement = "/blog/2016/03/11/ceylon-1-2-2/";
        zipFile = ReleaseFile {
            size = 19026629;
            linkName = "1_2_2";
            fileName = "ceylon-1.2.2.zip";
        };
        rpmFile = ReleaseFile {
            size = 17677484;
            linkName = "1_2_2_rpm";
            fileName = "ceylon-1.2.2-1.2.2-0.noarch.rpm";
        };
        debFile = ReleaseFile {
            size = 17303268;
            linkName = "1_2_2_deb";
            fileName = "ceylon-1.2.2_1.2.2_all.deb";
        };
    },
    Release {
        name = "Irregular Apocalypse";
        version = "1.2.1";
        date = date(2016, february, 11);
        releaseAnnouncement = "/blog/2016/02/11/ceylon-1-2-1/";
        zipFile = ReleaseFile {
            size = 18901057;
            linkName = "1_2_1";
            fileName = "ceylon-1.2.1.zip";
        };
        rpmFile = ReleaseFile {
            size = 17574130;
            linkName = "1_2_1_rpm";
            fileName = "ceylon-1.2.1-1.2.1-1.noarch.rpm";
        };
        debFile = ReleaseFile {
            size = 17198398;
            linkName = "1_2_1_deb";
            fileName = "ceylon-1.2.1_1.2.1_all.deb";
        };
    },
    Release {
        name = "A Series of Unlikely Explanations";
        version = "1.2.0";
        date = date(2015, october, 28);
        releaseAnnouncement = "/blog/2015/10/29/ceylon-1-2-0/";
        zipFile = ReleaseFile {
            size = 15525909;
            linkName = "1_2_0";
            fileName = "ceylon-1.2.0.zip";
        };
        rpmFile = ReleaseFile {
            size = 14224372;
            linkName = "1_2_0_rpm";
            fileName = "ceylon-1.2.0-1.2.0-0.noarch.rpm";
        };
        debFile = ReleaseFile {
            size = 13835404;
            linkName = "1_2_0_deb";
            fileName = "ceylon-1.2.0_1.2.0_all.deb";
        };
    },
    Release {
        name = "Ultimate Ship The Second";
        version = "1.1.0";
        date = date(2014, october, 9);
        releaseAnnouncement = "/blog/2014/10/09/ceylon-1/";
        zipFile = ReleaseFile {
            size = 13486105;
            linkName = "1_1_0";
            fileName = "ceylon-1.1.0.zip";
        };
        rpmFile = ReleaseFile {
            size = 12382016;
            linkName = "1_1_0_rpm";
            fileName = "ceylon-1.1.0-1.1.0-1.noarch.rpm";
        };
        debFile = ReleaseFile {
            size = 13004888;
            linkName = "1_1_0_deb";
            fileName = "ceylon-1.1.0_1.1.0_all.deb";
        };
    },
    Release {
        name = "No More Mr Nice Guy";
        version = "1.0.0";
        date = date(2013, november, 13);
        releaseAnnouncement = "/blog/2013/11/12/ceylon-1/";
        zipFile = ReleaseFile {
            size = 11617390;
            linkName = "1_0_0";
            fileName = "ceylon-1.0.0.zip";
        };
        rpmFile = ReleaseFile {
            size = 10653616;
            linkName = "1_0_0_rpm";
            fileName = "ceylon-1.0.0-1.0.0-0.noarch.rpm";
        };
        debFile = ReleaseFile {
            size = 11169076;
            linkName = "1_0_0_deb";
            fileName = "ceylon-1.0.0_1.0.0_all.deb";
        };
    },
    Release {
        name = "Virtual Boy";
        version = "1.0 beta";
        date = date(2013, september, 24);
        releaseAnnouncement = "/blog/2013/09/22/ceylon-1/";
        zipFile = ReleaseFile {
            size = 12492169;
            linkName = "1_0_Beta";
            fileName = "ceylon-0.6.1.zip";
        };
        rpmFile = ReleaseFile {
            size = 11608044;
            linkName = "1_0_Beta_rpm";
            fileName = "ceylon-0.6.1-1.noarch.rpm";
        };
        debFile = ReleaseFile {
            size = 12054930;
            linkName = "1_0_Beta_deb";
            fileName = "ceylon-0.6.1_0.6.1_all.deb";
        };
    },
    Release {
        name = "Virtual Boy";
        version = "M6 0.6";
        date = date(2013, september, 23);
        releaseAnnouncement = "/blog/2013/09/22/ceylon-1/";
        zipFile = ReleaseFile {
            size = 12486974;
            linkName = "1_0_Milestone6";
            fileName = "ceylon-0.6.zip";
        };
        rpmFile = ReleaseFile {
            size = 11569780;
            linkName = "1_0_Milestone6_rpm";
            fileName = "ceylon-0.6.0-0.noarch.rpm";
        };
        debFile = ReleaseFile {
            size = 12062326;
            linkName = "1_0_Milestone6_deb";
            fileName = "ceylon-0.6_0.6_all.deb";
        };
    },
    Release {
        name = "Nesa Pong";
        version = "M5 0.5";
        date = date(2013, march, 13);
        releaseAnnouncement = "/blog/2013/03/14/ceylon-m5-nesa-pong/";
        zipFile = ReleaseFile {
            size = 10739938;
            linkName = "1_0_Milestone5";
            fileName = "ceylon-0.5.zip";
        };
        rpmFile = ReleaseFile {
            size = 10142324;
            linkName = "1_0_Milestone5_rpm";
            fileName = "ceylon-0.5.0-0.noarch.rpm";
        };
        debFile = ReleaseFile {
            size = 10525758;
            linkName = "1_0_Milestone5_deb";
            fileName = "ceylon-0.5_0.5_all.deb";
        };
    },
    Release {
        name = "Analytical Engine";
        version = "M4 0.4";
        date = date(2012, october, 29);
        releaseAnnouncement = "/blog/2012/10/29/ceylon-m4-analytical-engine/";
        zipFile = ReleaseFile {
            size = 15358039;
            linkName = "1_0_Milestone4";
            fileName = "ceylon-0.4.zip";
        };
        rpmFile = ReleaseFile {
            size = 14588349;
            linkName = "1_0_Milestone4_rpm";
            fileName = "ceylon-0.4.0-0.noarch.rpm";
        };
        debFile = ReleaseFile {
            size = 15171038;
            linkName = "1_0_Milestone4_deb";
            fileName = "ceylon-0.4_0.4_all.deb";
        };
    },
    Release {
        name = "V2000";
        version = "M3.1 0.3.1";
        date = date(2012, july, 6);
        releaseAnnouncement = "/blog/2012/07/11/ceylon-m3_1/";
        zipFile = ReleaseFile {
            size = 11250165;
            linkName = "1_0_Milestone3_1";
            fileName = "ceylon-0.3.1.zip";
        };
        rpmFile = ReleaseFile {
            size = 10746597;
            linkName = "1_0_Milestone3_1_rpm";
            fileName = "ceylon-0.3.1-0.noarch.rpm";
        };
        debFile = ReleaseFile {
            size = 11072694;
            linkName = "1_0_Milestone3_1_deb";
            fileName = "ceylon-0.3.1_0.3.1_all.deb";
        };
    },
    Release {
        name = "V2000";
        version = "M3 0.3";
        date = date(2012, june, 21);
        releaseAnnouncement = "/blog/2012/06/25/ceylon-m3-v2000/";
        zipFile = ReleaseFile {
            size = 11114865;
            linkName = "1_0_Milestone3";
            fileName = "ceylon-0.3.zip";
        };
        rpmFile = ReleaseFile {
            size = 10522445;
            linkName = "1_0_Milestone3_rpm";
            fileName = "ceylon-0.3.0-0.noarch.rpm";
        };
        debFile = ReleaseFile {
            size = 10946796;
            linkName = "1_0_Milestone3_deb";
            fileName = "ceylon-0.3_0.3_all.deb";
        };
    },
    Release {
        name = "Minitel";
        version = "M2 0.2";
        date = date(2012, march, 2);
        releaseAnnouncement = "/blog/2012/03/20/ceylon-m2-minitel/";
        zipFile = ReleaseFile {
            size = 7289309;
            linkName = "1_0_Milestone2";
            fileName = "ceylon-0.2.zip";
        };
        rpmFile = ReleaseFile {
            size = 6808289;
            linkName = "1_0_Milestone2_rpm";
            fileName = "ceylon-0.2.0-0.noarch.rpm";
        };
        debFile = ReleaseFile {
            size = 7137898;
            linkName = "1_0_Milestone2_deb";
            fileName = "ceylon-0.2_0.2_all.deb";
        };
    },
    Release {
        name = "Newton";
        version = "M1 0.1";
        date = date(2011, december, 20);
        releaseAnnouncement = "/blog/2011/12/20/ceylon-m1-newton/";
        zipFile = ReleaseFile {
            size = 5757161;
            linkName = "1_0_Milestone1";
            fileName = "ceylon-0.1.zip";
        };
        rpmFile = ReleaseFile {
            size = 5569160;
            linkName = "1_0_Milestone1_rpm";
            fileName = "ceylon-0.1.0-0.noarch.rpm";
        };
        debFile = ReleaseFile {
            size = 5632032;
            linkName = "1_0_Milestone1_deb";
            fileName = "ceylon-0.1_0.1_all.deb";
        };
    }
];

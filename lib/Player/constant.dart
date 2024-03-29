class AppConstantValues{
  static const playlistUri = 'https://demo.unified-streaming.com/k8s/features/stable/video/tears-of-steel/tears-of-steel.mp4/.m3u8';

static const sampleMaster = '''
#EXTM3U
#EXT-X-VERSION:1
## Created with Unified Streaming Platform  (version=1.13.0-29687)

# variants
#EXT-X-STREAM-INF:BANDWIDTH=493000,CODECS="mp4a.40.2,avc1.66.30",RESOLUTION=224x100,FRAME-RATE=24
tears-of-steel-audio_eng=64008-video_eng=401000.m3u8
#EXT-X-STREAM-INF:BANDWIDTH=932000,CODECS="mp4a.40.2,avc1.66.30",RESOLUTION=448x200,FRAME-RATE=24
tears-of-steel-audio_eng=128002-video_eng=751000.m3u8
#EXT-X-STREAM-INF:BANDWIDTH=1197000,CODECS="mp4a.40.2,avc1.77.31",RESOLUTION=784x350,FRAME-RATE=24
tears-of-steel-audio_eng=128002-video_eng=1001000.m3u8
#EXT-X-STREAM-INF:BANDWIDTH=1727000,CODECS="mp4a.40.2,avc1.100.40",RESOLUTION=1680x750,FRAME-RATE=24,VIDEO-RANGE=SDR
tears-of-steel-audio_eng=128002-video_eng=1501000.m3u8
#EXT-X-STREAM-INF:BANDWIDTH=2468000,CODECS="mp4a.40.2,avc1.100.40",RESOLUTION=1680x750,FRAME-RATE=24,VIDEO-RANGE=SDR
tears-of-steel-audio_eng=128002-video_eng=2200000.m3u8

# variants
#EXT-X-STREAM-INF:BANDWIDTH=1024000,CODECS="mp4a.40.2,hvc1.1.6.L150.90",RESOLUTION=1680x750,FRAME-RATE=24,VIDEO-RANGE=SDR
tears-of-steel-audio_eng=64008-video_eng_1=902000.m3u8
#EXT-X-STREAM-INF:BANDWIDTH=1367000,CODECS="mp4a.40.2,hvc1.1.6.L150.90",RESOLUTION=2576x1150,FRAME-RATE=24,VIDEO-RANGE=SDR
tears-of-steel-audio_eng=128002-video_eng_1=1161000.m3u8
#EXT-X-STREAM-INF:BANDWIDTH=1814000,CODECS="mp4a.40.2,hvc1.1.6.L150.90",RESOLUTION=3360x1500,FRAME-RATE=24,VIDEO-RANGE=SDR
tears-of-steel-audio_eng=128002-video_eng_1=1583000.m3u8

# variants
#EXT-X-STREAM-INF:BANDWIDTH=68000,CODECS="mp4a.40.2"
tears-of-steel-audio_eng=64008.m3u8
#EXT-X-STREAM-INF:BANDWIDTH=136000,CODECS="mp4a.40.2"
tears-of-steel-audio_eng=128002.m3u8
''';
}
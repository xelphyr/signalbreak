using System.Threading.Tasks.Dataflow;
using Godot;

public partial class AudioManager : Node
{

    [Export] 
    private AudioStreamPlayer Player { get; set; }
    
    private AudioStreamGeneratorPlayback _playback;
    private float _sampleHz;
    private float _pulseHz = 440.0f;
    private double phase = 0.0f;

    public override void _Ready()
    {
        if (Player.Stream is AudioStreamGenerator generator) {
            
            _sampleHz = generator.MixRate;
            Player.Play();
            _playback = (AudioStreamGeneratorPlayback)Player.GetStreamPlayback();
            FillBuffer();
        }
    }

    public void FillBuffer()
    {
        GD.Print("Stareting to fill buffer");
        float increment = _pulseHz / _sampleHz;
        int framesAvailable = _playback.GetFramesAvailable();

        for (int i = 0; i < framesAvailable; i++)
        {
            _playback.PushFrame(Vector2.One * (float)Mathf.Sin(phase * Mathf.Tau));
            phase = Mathf.PosMod(phase + increment, 1.0f);
        }
    }
}